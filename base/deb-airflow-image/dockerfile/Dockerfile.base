FROM apache/airflow:2.5.0
# default ENV
ENV AIRFLOW__CORE__DAGS_ARE_PAUSED_AT_CREATION='true'
ENV AIRFLOW__CORE__LOAD_EXAMPLES='false'
ENV AIRFLOW__API__AUTH_BACKENDS='airflow.api.auth.backend.basic_auth'
ENV AIRFLOW__CORE__EXECUTOR=CeleryExecutor
# default dag
ADD --chown=airflow:root dags /opt/airflow/dags
# switch user
USER airflow
