#!/bin/bash

echo "mariadb"
sudo yum install -y mariadb-server mariadb
sudo systemctl restart mariadb
sudo systemctl enable mariadb
mysql -sfu root < mariadb_setup.sql
sudo firewall-cmd --add-service=mysql --permanent
sudo firewall-cmd --reload

echo "bacula"
sudo yum -y install bacula-director bacula-storage bacula-console
echo 1 | sudo alternatives --config libbaccats.so
sudo /usr/libexec/bacula/grant_mysql_privileges -u root -p123456
sudo /usr/libexec/bacula/create_mysql_database -u root -p123456
sudo /usr/libexec/bacula/make_mysql_tables -u root -p123456
