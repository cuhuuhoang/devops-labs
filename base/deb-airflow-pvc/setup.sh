#!/bin/bash

kubectl create namespace airflow --dry-run=client -o yaml | kubectl apply -f -
for storage in mysql dags logs plugins; do
    kubectl -n airflow apply -f airflow-"$storage"-storage.yaml
done

ssh -o StrictHostKeyChecking=no a2.vt "sudo mkdir -p /opt/data/{dags,logs,plugins}; sudo chown 50000 -R /opt/data"
