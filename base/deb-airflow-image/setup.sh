#!/bin/bash

sudo ctr -n=k8s.io images rm docker.io/library/airflow:1.0.0
sudo ctr -n=k8s.io images import airflow.tar
