#!/bin/bash

sudo cp daemon.json /etc/docker/daemon.json
sudo systemctl restart docker

docker build -t node-app -f redis-consumer/Dockerfile redis-consumer
docker tag node-app:latest a4.vt:5000/node-app

docker stop registry
docker rm registry
docker run -d --network host --restart always --name registry registry:2
sleep 5
docker push a4.vt:5000/node-app
