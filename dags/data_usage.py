import os
import sys
import json
from datetime import timedelta, datetime
import logging
import traceback
from airflow import DAG
from airflow.operators.postgres_operator import PostgresOperator
#from airflow.operator.
# from airflow.operator.



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
        upload_data_to_s3 = PostgresOperator(
                            task_id=f'set_data_to_s3',
                            sql=f"""fn_gp_queries_history_to_s3_operation(
                                p_date_from := '{start_date}'::timestamp,
                                p_date_to := '{start_date}'::timestamp + '1 day'::interval
                            )""",
                            postgres_conn_id=CONNECTION_ID,
                            pool=POOL,
                            priority_weight=priority_weight,
                            dag=dag)
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
