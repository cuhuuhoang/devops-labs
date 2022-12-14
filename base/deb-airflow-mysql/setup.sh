#!/bin/bash

set -e

echo "create airflow namespace"
kubectl create namespace airflow --dry-run=client -o yaml | kubectl apply -f -

echo "mysql-configmap.yaml"
kubectl apply -f mysql-configmap.yaml -n airflow

echo "mysql-storage.yaml"
kubectl apply -f mysql-storage.yaml -n airflow

echo "verify storage"
kubectl get pv -n airflow
kubectl get pvc -n airflow

echo "mysql-deployment.yaml"
kubectl apply -f mysql-deployment.yaml -n airflow

kubectl get pods -n airflow

echo "mysql-service.yaml"
kubectl apply -f mysql-service.yaml -n airflow

echo "some manual init"
#https://www.clearpeaks.com/deploying-apache-airflow-on-a-kubernetes-cluster/
sleep 1m
kubectl -n airflow exec -i $(kubectl -n airflow get pods --no-headers -o custom-columns=':metadata.name' --selector app=airflow-mysql) -- /usr/bin/mysql -u root -ppwairflow airflow < airflow_init.sql

echo "confirm"
kubectl -n airflow exec -i $(kubectl -n airflow get pods --no-headers -o custom-columns=':metadata.name' --selector app=airflow-mysql) -- /usr/bin/mysql -u root -ppwairflow airflow -e "show tables" | head
