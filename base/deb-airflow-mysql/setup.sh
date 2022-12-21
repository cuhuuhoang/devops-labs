#!/bin/bash

set -e

echo "create airflow namespace"
kubectl create namespace airflow --dry-run=client -o yaml | kubectl apply -f -

echo "mysql-configmap.yaml"
kubectl -n airflow apply -f mysql-configmap.yaml

kubectl -n airflow apply -f mysql-storage.yaml
echo "mysql-deployment.yaml"
kubectl -n airflow apply -f mysql-deployment.yaml

kubectl get pods -n airflow

echo "mysql-service.yaml"
kubectl -n airflow apply -f mysql-service.yaml

