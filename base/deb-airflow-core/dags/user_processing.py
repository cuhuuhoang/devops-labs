from airflow import DAG
from airflow.providers.mysql.operators.mysql import MySqlOperator
from airflow.providers.http.sensors.http import HttpSensor
from airflow.providers.http.operators.http import SimpleHttpOperator
from airflow.operators.python import PythonOperator
from airflow.providers.mysql.hooks.mysql import MySqlHook

import json
from pandas import json_normalize
from datetime import datetime


def _process_user(ti):
    user = ti.xcom_pull(task_ids='extract_user')
    user = user['results'][0]
    processed_user = json_normalize({
        'firstname': user['name']['first'],
        'lastname': user['name']['last'],
        'country': user['location']['country'],
        'username': user['login']['username'],
        'password': user['login']['password'],
        'email': user['email']
    })
    processed_user.to_csv('/tmp/processed_user.csv', index=None, header=False, sep='\t')


def _store_user(ti):
    hook = MySqlHook(mysql_conn_id='mysql')
    hook.bulk_load(
        table='users',
        tmp_file='/tmp/processed_user.csv'
    )


with DAG('user_processing', start_date=datetime(2022, 1, 1),
         schedule_interval='@daily', catchup=False) as dag:

    create_table = MySqlOperator(
        task_id='create_table',
        mysql_conn_id='mysql',
        sql='''
            CREATE TABLE IF NOT EXISTS users (
                firstname TEXT NOT NULL,
                lastname TEXT NOT NULL,
                country TEXT NOT NULL,
                username TEXT NOT NULL,
                password TEXT NOT NULL,
                email TEXT NOT NULL
            );
        '''
    )

    set_local_infile = MySqlOperator(
        task_id='set_local_infile',
        mysql_conn_id='mysql_admin',
        sql='''
                SET GLOBAL local_infile=1;
            '''
    )

    is_api_available = HttpSensor(
        task_id='is_api_available',
        http_conn_id='user_api',
        endpoint='api/'
    )

    extract_user = SimpleHttpOperator(
        task_id='extract_user',
        http_conn_id='user_api',
        endpoint='api/',
        method='GET',
        response_filter=lambda response: json.loads(response.text),
        log_response=True
    )

    process_user = PythonOperator(
        task_id='process_user',
        python_callable=_process_user
    )

    store_user = PythonOperator(
        task_id='store_user',
        python_callable=_store_user
    )

create_table >> extract_user >> process_user >> store_user
is_api_available >> extract_user
set_local_infile >> extract_user
