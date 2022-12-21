#!/bin/bash

cd /home/hoangch/data/devops/manage/base/deb-airflow-image
image="a1.vt:31320/airflow:1.0.0"
docker build -t "$image" .
docker push "$image"
