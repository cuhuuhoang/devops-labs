#!/bin/bash

echo "mariadb"
sudo yum install -y mariadb-server mariadb
sudo systemctl restart mariadb
sudo systemctl enable mariadb
mysql -sfu root < mariadb_setup.sql
sudo firewall-cmd --add-service=mysql --permanent
sudo firewall-cmd --permanent --add-port=9101/tcp
sudo firewall-cmd --permanent --add-port=9103/tcp
sudo firewall-cmd --reload

echo "bacula"
sudo yum -y install bacula-director bacula-storage bacula-console
echo 1 | sudo alternatives --config libbaccats.so
sudo /usr/libexec/bacula/grant_mysql_privileges -u root -p123456
sudo /usr/libexec/bacula/create_mysql_database -u root -p123456
sudo /usr/libexec/bacula/make_mysql_tables -u root -p123456

echo "config"
sudo cp new/bacula-dir.conf /etc/bacula/bacula-dir.conf
sudo cp new/bconsole.conf /etc/bacula/bconsole.conf
sudo cp new/make_catalog_backup.pl /usr/libexec/bacula/make_catalog_backup.pl
sudo cp new/bacula-sd.conf /etc/bacula/bacula-sd.conf

echo "restart"
sudo systemctl restart bacula-dir
sudo systemctl enable bacula-dir
sudo systemctl restart bacula-sd
sudo systemctl enable bacula-sd
