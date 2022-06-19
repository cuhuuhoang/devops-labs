#!/bin/bash

user="prometheus"
if ! getent passwd "$user" >/dev/null; then
    sudo useradd -r -s /sbin/nologin 2>/dev/null "$user"
fi

if [ ! -d /usr/lib/prometheus ]; then
	sudo yum install tar -y
	tar -xzvf prometheus-2.2.1.linux-amd64.tar.gz
	sudo mv prometheus-2.2.1.linux-amd64/ /usr/lib/prometheus
	sudo chown -R prometheus /usr/lib/prometheus
fi

echo "service"
sudo cp prometheus.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus

echo "firewall"
sudo firewall-cmd --add-port=9090/tcp --permanent
sudo firewall-cmd --reload

echo "add exporter"
sudo cp prometheus.yml /usr/lib/prometheus
sudo systemctl restart prometheus

echo "grafana"
sudo mkdir -p /etc/yum.repos.d
sudo cp grafana.repo /etc/yum.repos.d/grafana.repo
sudo yum install grafana-enterprise -y

sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl enable grafana-server.service

echo "firewall"
sudo firewall-cmd --add-port=3000/tcp --permanent
sudo firewall-cmd --reload
