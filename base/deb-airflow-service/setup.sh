#!/bin/bash

for svc in webserver flower; do
    kubectl -n airflow delete -f "$svc"-service.yaml
    kubectl -n airflow apply -f "$svc"-service.yaml
done
cp get_port.sh ~/.
./get_port.sh
