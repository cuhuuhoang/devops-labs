#!/bin/bash

kubectl -n rook-ceph get svc | grep LoadBalancer
kubectl -n airflow get svc | grep LoadBalancer
