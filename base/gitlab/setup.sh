#!/bin/bash

echo "pre"
sudo yum install epel-release -y
sudo systemctl stop firewalld
sudo systemctl disable firewalld

echo "depend"
sudo yum install -y policycoreutils-python

echo "repo"
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
sudo EXTERNAL_URL="http://a1.vt" yum install -y gitlab-ce

echo "pass for id root"
sudo cat /etc/gitlab/initial_root_password
