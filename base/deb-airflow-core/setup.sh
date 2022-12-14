#!/bin/bash

echo "Stop all"
for svc in webserver redis; do
    kubectl -n airflow delete -f "$svc"-service.yaml
done
for comp in scheduler webserver triggerer redis worker1; do
    kubectl -n airflow delete -f "$comp"-deployment.yaml
done
for storage in dags logs plugins; do
    kubectl -n airflow delete -f airflow-"$storage"-storage.yaml
done
kubectl -n airflow delete -f airflow-configmap.yaml

sleep 5
echo "start all"
kubectl -n airflow apply -f airflow-configmap.yaml
for storage in dags logs plugins; do
    kubectl -n airflow apply -f airflow-"$storage"-storage.yaml
done
for comp in scheduler webserver triggerer redis worker1; do
    kubectl -n airflow apply -f "$comp"-deployment.yaml
done
for svc in webserver redis; do
    kubectl -n airflow apply -f "$svc"-service.yaml
done
sleep 10
echo "====="
kubectl -n airflow get all
