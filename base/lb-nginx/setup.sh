#!/bin/bash

#can only run on a1
sudo yum install -y nginx
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --reload
sudo cp load-balancing.conf /etc/nginx/conf.d/load-balancing.conf
sudo systemctl restart nginx
sudo setsebool -P httpd_can_network_connect 1
