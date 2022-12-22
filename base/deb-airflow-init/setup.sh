#!/bin/bash

kubectl -n airflow apply -f airflow-init-deployment.yaml
sleep 60s
kubectl -n airflow exec deploy/airflow-init -- sh -c "chown -R 50000:0 /xx"
sleep 5s
kubectl -n airflow delete -f airflow-init-deployment.yaml
