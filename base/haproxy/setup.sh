#!/bin/bash

sudo yum install -y haproxy
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
sudo cp haproxy.cfg /etc/haproxy/haproxy.cfg
sudo systemctl start haproxy
