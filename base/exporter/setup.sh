#!/bin/bash

user="prometheus"
if ! getent passwd "$user" >/dev/null; then
    sudo useradd -r -s /sbin/nologin 2>/dev/null "$user"
fi

sudo yum install tar -y

tar -xzvf node_exporter-0.16.0-rc.1.linux-amd64.tar.gz
[ -d /usr/lib/node_exporter ] && sudo rm -r /usr/lib/node_exporter
sudo mv node_exporter-0.16.0-rc.1.linux-amd64 /usr/lib/node_exporter

sudo cp node_exporter.service /etc/systemd/system/

echo "start service"
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter


echo "firewall"
sudo firewall-cmd --add-port=9100/tcp --permanent
sudo firewall-cmd --reload
