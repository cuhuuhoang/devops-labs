#!/bin/bash

echo "Stop all"
for comp in scheduler webserver triggerer flower worker1 worker2; do
    kubectl -n airflow delete -f "$comp"-deployment.yaml
done

sleep 5
echo "start all"
for comp in scheduler webserver triggerer flower worker1 worker2; do
    kubectl -n airflow apply -f "$comp"-deployment.yaml
done
