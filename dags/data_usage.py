from ast import Raise
import os
import sys
import json
from datetime import timedelta, datetime
import logging
import traceback
from airflow import DAG
from airflow.operators.postgres_operator import PostgresOperator
from airflow.hooks.S3_hook import S3Hook
from airflow.hooks.postgres_hook import PostgresHook
from airflow.operators.python_operator import PythonOperator
from sql_metadata import Parser


dag_folder = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, dag_folder)

#from data_usage import  get_meta



MODULE_NAME = 'data_usage'
DAG_OWNER_NAME = "dp_dm"
DEFAULT_SCHEDULE = "@monthly"
DEFAULT_EMAIL = 'ml.data_management_processing@leroymerlin.ru'
ENV = os.environ.get("DP__ENV", "dev").lower()
CONNECTION_ID = "maintenancebot"
POOL = "data_usage"
DEFAULT_CAN_EDIT = ['dataplatform', 'datamanagement']
DEFAULT_TAG = ['datamanagement', 'data_usage']
base_url = os.environ.get("DP__METADATA_URL_V2")
api_endpoint = "/api/v2/"
S3_CONNECTION = S3Hook(aws_conn_id='s3-data-usege')
S3_BUCKECT = 'd-dp-data-usage'
TARGET_CONNECTION_ID = 'data_useges_etl_bot'


def check_bucket_in_s3():
    if (S3_CONNECTION.check_for_bucket(bucket_name=S3_BUCKECT)):
        raise ValueError('Bucker not found')


def read_data_from_s3 (key: str) ->str:
    """ Функция получает по ключю из файла все данны и склеивает в одну большую строку
    """
    records = S3_CONNECTION.select_key(
        Bucket=S3_BUCKECT,
        Key=key,
        ExpressionType='SQL',
        Expression="""
            select 
                s._1 as ctime,
                s._5 as user_name,
                s._6 as db,
                s._12 as rows_out,
                s._18 as query_text
            from s3object s
        """,
        InputSerialization={
            'CSV': {
            },
            'CompressionType': 'GZIP',
        },
        OutputSerialization={'JSON': {
            'RecordDelimiter': '\n'
        }},
    )
    return records

def transfer_all_data_to_pg():
    pg = PostgresHook(postgres_conn_id=TARGET_CONNECTION_ID)
    json_query = """INSERT INTO json_query (json_object)
                      VALUES (%s);"""
    files = S3_CONNECTION.list_prefixes(bucket_name=S3_BUCKECT, prefix='/public/queries_history/')
    for key in files:
        records = read_data_from_s3(key=key)
        for record in records.split("\n"):
            row = json.loads(record)
            sql = row['query_text']
            try:
                parser = Parser(sql)
                row['tables'] = parser.tables
                row['columns'] = parser.columns
            except ValueError:
                pass
            row_to_pg = json.dumps(row)
            pg.run(sql=json_query, autocommit=True, parameters=(row_to_pg))


def create_dag(dag_id, config):
    try:
        start_date = datetime.strptime(config['start_date'], '%Y-%m-%d')
        access_list = ['test']
        tags = []
        access_control = {item: {'can_dag_edit'} for item in ['dp']}
        default_args = {
            'owner': config['owner'],
            'depends_on_past': False,
            'start_date': start_date,
            'retries': 4,
            'retry_delay': timedelta(minutes=1),
            'provide_context': True,
            'queue': 'partitioning_v2',
            'email': config['email'],
            'email_on_failure': True,
            'email_on_retry': False
        }
        dag = DAG(
            dag_id=dag_id,
            default_args=default_args,
            schedule_interval=config['schedule'],
            max_active_runs=1,
            tags=tags,
            # pool=POOL,
            access_control=access_control
        )
        priority_weight = 100
        check_bucet_exist = PythonOperator(
            task_id='check_bucket_in_s3',
            python_callable=check_bucket_in_s3,
            dag=dag
        )
        upload_data_to_s3 = PostgresOperator(
                            task_id='set_data_to_s3',
                            sql=f"""fn_gp_queries_history_to_s3_operation(
                                p_date_from := '{start_date}'::timestamp,
                                p_date_to := '{start_date}'::timestamp + '1 day'::interval
                            )""",
                            postgres_conn_id=CONNECTION_ID,
                            pool=POOL,
                            priority_weight=priority_weight,
                            dag=dag)
        
        transfer_data = PythonOperator(
            task_id='transfer_data_to_pg',
            python_callable=transfer_all_data_to_pg,
            dag=dag
        )
        check_bucet_exist >> upload_data_to_s3 >> transfer_data
        return dag
    except Exception as e:
        logging.error(f"Unable to create DAG {dag_id}: {traceback.format_exc()}")
        print(e)

conf ={
    'start_date': '2010-01-01',
    'schedule': '0 * * * *',
    'owner': 'data',
    'email': 'test@test.ru'
}

dag_id = MODULE_NAME
dag = create_dag(
        dag_id,
        conf
    )
if dag is not None:
    globals()[dag_id] = dag
