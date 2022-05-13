#!/bin/bash

sudo yum install java-1.8.0-openjdk.x86_64 -y
sudo yum install wget -y

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum install jenkins -y

sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service
sudo systemctl status jenkins

sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

echo "Password"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
