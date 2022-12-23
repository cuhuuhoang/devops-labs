#!/bin/bash

set -euo pipefail

TEMP_DOCKER_DIR=$(mktemp -d)
curl https://raw.githubusercontent.com/apache/airflow/main/Dockerfile -o "$TEMP_DOCKER_DIR"/Dockerfile

pushd "${TEMP_DOCKER_DIR}"

# [START build]
export DOCKER_BUILDKIT=1

docker build . \
    --pull \
    --build-arg PYTHON_BASE_IMAGE="python:3.8-buster" \
    --build-arg AIRFLOW_INSTALLATION_METHOD="apache-airflow" \
    --build-arg AIRFLOW_VERSION="2.5.0" \
    --build-arg INSTALL_MYSQL_CLIENT="true" \
    --build-arg INSTALL_MSSQL_CLIENT="false" \
    --build-arg INSTALL_POSTGRES_CLIENT="false" \
    --tag "airflow-base:1.0.0"


# [END build]

popd
rm -rf "${TEMP_DOCKER_DIR}"
