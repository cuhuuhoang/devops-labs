#!/bin/bash

sudo yum install -y nginx
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --reload
sudo cp proxy-a1.conf /etc/nginx/conf.d/proxy-a1.conf
sudo systemctl restart nginx
sudo setsebool -P httpd_can_network_connect 1
