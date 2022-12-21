#!/bin/bash

kubectl create namespace airflow --dry-run=client -o yaml | kubectl apply -f -

for storage in dags logs plugins data; do
    kubectl -n airflow apply -f airflow-"$storage"-storage.yaml
done

