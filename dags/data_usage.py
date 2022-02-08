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
from funcsigs import Parameter
from sql_metadata import Parser
import boto3
import json
import re


dag_folder = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, dag_folder)

#from data_usage import  get_meta
class NoDataInS3(Exception):
    pass 


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
S3_CONNECTION = S3Hook(aws_conn_id='s3-data-usage')
S3_BUCKECT = 'd-dp-data-usage'
TARGET_CONNECTION_ID = 'data_usage_etl_bot'





def init_boto_3_client() ->boto3.client :
    """Функция инициализирует клиента, для работы с S3.
    """
    connection = S3_CONNECTION.get_connections(conn_id='s3-data-usage')[0]
    s3 = boto3.client('s3',
                  endpoint_url=connection.host+":"+ str(connection.port),
                  aws_access_key_id=connection.login,
                  aws_secret_access_key=connection.get_password(),
                  region_name='us-east-1')
    return s3


def read_data_from_s3 (s3, key: str) ->str:
    """ Функция получает по ключю из файла все данны и склеивает в одну большую строку
    """
    logging.info("read_data_from_s3")
    logging.info(f"for key={key}")
    r = s3.select_object_content(
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
    for event in r['Payload']:
        if 'Records' in event:
         records = event['Records']['Payload'].decode('utf-8')
         return records
    raise NoDataInS3('No data in S3')

def get_table_struct(colums: list) -> list:
    """ Фкнкция выделяет из колонки схему, имя таблицы и саму колонку
    """
    result = []
    table_colums = {}
    if len(colums) == 0:
        return result
    p = re.compile(r'\.')
    for item in colums:
        colum = p.split(item)
        if len(colum) == 3:
            table_colums = {
                'table_schema' : colum[0],
                'table_name' : colum[1],
                'table_colum' : colum[2],
            }
        elif len(colum) == 2:
            table_colums = {
                'table_schema' : 'public',
                'table_name' : colum[0],
                 'table_colum' : colum[1],
            }
        result.append(table_colums)
    return result

def transfer_all_data_to_pg():
    '''Функция переносит данные из S3 и PG.
    '''
    logging.info(f"Start transfer data to PG {TARGET_CONNECTION_ID}")
    pg = PostgresHook(postgres_conn_id=TARGET_CONNECTION_ID)
    logging.info(f"PG hook {pg}")
    s3 = init_boto_3_client()
    files = s3.list_objects(Bucket= S3_BUCKECT, Prefix='public/queries_history')
    if not isinstance(files, dict):
        return 0
    if not 'Contents' in files:
        logging.debug("Not file to processing")
        return 0
    for key in files['Contents']:
        logging.info(f"files key =  {key}")
        if not re.match(r'.*\.gz$', key['Key']):
            logging.info("Processing only .gz file")
            continue
        records = read_data_from_s3(s3=s3, key=key['Key'])
        logging.debug(f"reconds =  {records}")
        for record in records.split("\n"):
            logging.debug(f"row to parsing =  {records}")
            try:
                row = json.loads(record)
                sql = row['query_text']
                parser = Parser(sql)
                row['tables'] = parser.tables
                row['columns'] = get_table_struct(parser.columns)
                row_to_pg = json.dumps(row)
                json_query = f"""INSERT INTO data_usage_raw.queries_history (json_object)
                        VALUES ($${row_to_pg}$$);"""
                logging.debug(json_query)
                pg.run(sql=json_query)
            except  json.JSONDecodeError:
                logging.error(json_query)
            except ValueError:
                logging.error(json_query)
        records = s3.delete_object( Bucket= S3_BUCKECT, Key=key['Key'])


def create_dag(dag_id, config):
    try:
        start_date = datetime.strptime(config['start_date'], '%Y-%m-%d')
        access_list = ['test']
        tags = []
        access_control = {item: {'can_dag_edit'} for item in ['datamanagement']}
        default_args = {
            'owner': config['owner'],
            'depends_on_past': False,
            'start_date': start_date,
            'retries': 1,
            'retry_delay': timedelta(minutes=1),
            'provide_context': True,
            'queue': 'data_usage',
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
            access_control=access_control
        )
        priority_weight = 100

        upload_data_to_s3 = PostgresOperator(
                            task_id='set_data_to_s3',
                            sql=f"""SELECT fn_gp_queries_history_to_s3_operation(
                                p_date_from := '{start_date}'::timestamp ,
                                p_date_to := '{start_date}'::timestamp + '1 day'::interval 
                            )""",
                            postgres_conn_id=CONNECTION_ID,
                            pool=POOL,
                            priority_weight=priority_weight,
                            dag=dag)
        
        transfer_data = PythonOperator(
            task_id='transfer_data_to_pg',
            python_callable=transfer_all_data_to_pg,
            provide_context=False,
            dag=dag
        )
        load_marts_query_with_tables_columns = PostgresOperator(
                            task_id='fn_load_f_query_with_tables_columns',
                            sql="""SELECT data_usage_marts.fn_load_f_query_with_tables_columns('etl_bot'); 
                            """,
                            postgres_conn_id=TARGET_CONNECTION_ID,
                            pool=POOL,
                            priority_weight=priority_weight,
                            dag=dag)

        upload_data_to_s3 >> transfer_data >> load_marts_query_with_tables_columns
        return dag
    except Exception as e:
        logging.error(f"Unable to create DAG {dag_id}: {traceback.format_exc()}")
        print(e)

conf ={
    'start_date': '2020-01-01',
    'schedule': '@daily',
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
