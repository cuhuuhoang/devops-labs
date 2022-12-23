#!/bin/bash

dir=$( dirname -- "$0"; )
cd $dir
image="a1.vt:31320/airflow:1.0.0"
docker build -t "$image" -f dockerfile/Dockerfile.$1 .
