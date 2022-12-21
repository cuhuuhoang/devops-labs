#!/bin/bash

kubectl create namespace airflow --dry-run=client -o yaml | kubectl apply -f -

kubectl -n airflow apply -f redis-storage.yaml
kubectl -n airflow apply -f redis-configmap.yaml
kubectl -n airflow apply -f redis-deployment.yaml
kubectl -n airflow apply -f redis-service.yaml
