from airflow import DAG, Dataset
from airflow.decorators import task

from datetime import datetime

my_file = Dataset('/tmp/my_file')
my_file_2 = Dataset('/tmp/my_file_2')

with DAG(
    dag_id='dataset_producer',
    schedule='@daily',
    start_date=datetime(2022, 1, 1),
    catchup=False
):
    @task(outlets=[my_file])
    def update_dataset():
        with open(my_file.uri, "a+") as f:
            f.write("producer update 1")

    @task(outlets=[my_file_2])
    def update_dataset_2():
        with open(my_file_2.uri, "a+") as f:
            f.write("producer update 2")

    update_dataset()
    update_dataset_2()
