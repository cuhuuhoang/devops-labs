#!/bin/bash

sudo yum install squid -y
sudo cp squid.conf /etc/squid/squid.conf
sudo cp block.lst /etc/squid/block.lst
sudo systemctl restart squid
sudo firewall-cmd --permanent --add-port=3128/tcp
sudo firewall-cmd --reload
