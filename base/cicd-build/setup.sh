#!/bin/bash

#at base
mkdir -p ~/.docker

# a fix for docker dns, may need to reboot here
sudo cp daemon.json /etc/docker/daemon.json

# password for push gitlab
cp passwordhere-config.json ~/.docker/config.json

#somewhere else
mkdir -p ~/git
cd ~/git
[ -d "test-cicd" ] && rm -rf "test-cicd"

git clone git@gitlab.com:cuhuuhoang/test-cicd.git
cd ~/git/test-cicd

docker build -t test-cicd:v1 .
docker tag test-cicd:v1 registry.gitlab.com/cuhuuhoang/test-cicd

#then push
#docker push registry.gitlab.com/cuhuuhoang/test-cicd
