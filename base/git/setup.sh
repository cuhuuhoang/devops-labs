#!/bin/bash

sudo yum install -y git
git config --global user.email "huuhoangcu@gmail.com"
git config --global user.name "huuhoangcu"
ssh-keyscan gitlab.com >> ~/.ssh/known_hosts
