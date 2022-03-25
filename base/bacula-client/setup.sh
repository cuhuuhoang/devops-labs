#!/bin/bash

echo "bacula-client"
sudo yum -y install bacula-client bacula-console
sudo firewall-cmd --permanent --add-port=9102/tcp
sudo firewall-cmd --reload

echo "config"
sudo cp bacula-fd.conf /etc/bacula/bacula-fd.conf
sudo cp bconsole.conf /etc/bacula/bconsole.conf

echo "restart"
sudo systemctl restart bacula-fd
sudo systemctl enable bacula-fd
