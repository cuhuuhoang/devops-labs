#!/bin/bash

for conf in init core; do
    kubectl -n airflow delete -f airflow-"$conf"-configmap.yaml
    kubectl -n airflow apply -f airflow-"$conf"-configmap.yaml
done
