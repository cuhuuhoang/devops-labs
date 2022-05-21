#!/bin/bash

host="a4.vt"

sudo cp daemon.json /etc/docker/daemon.json
sudo systemctl restart docker
docker stop registry
docker rm registry
docker run -d --network host --restart always --name registry registry:2

for img in "hello-web" "redis-consumer"; do
	docker build -t "$img" -f "$img"/Dockerfile "$img"
	docker tag "$img":latest "$host":5000/"$img"
	docker push "$host":5000/"$img"
done
