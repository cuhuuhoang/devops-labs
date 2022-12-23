export DOCKER_BUILDKIT=1

docker build . \
    --pull \
    --build-arg PYTHON_BASE_IMAGE="python:3.7-slim-bullseye" \
    --build-arg AIRFLOW_INSTALLATION_METHOD="apache-airflow" \
    --build-arg AIRFLOW_VERSION="${AIRFLOW_VERSION}" \
    --build-arg INSTALL_MYSQL_CLIENT="false" \
    --build-arg INSTALL_MSSQL_CLIENT="false" \
    --build-arg INSTALL_POSTGRES_CLIENT="true" \
    --build-arg AIRFLOW_PRE_CACHED_PIP_PACKAGES="false" \
    --build-arg DOCKER_CONTEXT_FILES="docker-context-files" \
    --build-arg INSTALL_PACKAGES_FROM_CONTEXT="true" \
    --build-arg AIRFLOW_CONSTRAINTS_LOCATION="/docker-context-files/constraints-3.7.txt" \
    --tag airflow-my-restricted-environment:0.0.1
