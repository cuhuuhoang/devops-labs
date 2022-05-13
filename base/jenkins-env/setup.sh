#!/bin/bash

#sudo yum install epel-release -y
#sudo yum update -y
sudo timedatectl set-timezone Asia/Ho_Chi_Minh
sudo yum -y install chrony
sudo systemctl enable chronyd.service
sudo systemctl restart chronyd.service
sudo chronyc sources
sudo timedatectl set-local-rtc 0
sudo reboot
