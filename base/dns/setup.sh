#!/bin/bash

. ../settings.sh
. ../env.sh

sudo yum install -y bind bind-utils
sudo cp named.conf /etc/named.conf
sudo cp vt.db /var/named/vt.db
sudo cp 192.168.100.db /var/named/192.168.100.db
sudo firewall-cmd --permanent --add-port=53/udp
sudo firewall-cmd --reload
sudo systemctl enable named
sudo systemctl restart named
