#!/bin/bash

echo "first install"
sudo yum -y install httpd
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --reload
sudo rm -f /etc/httpd/conf.d/welcome.conf
sudo yum -y install php php-pdo php-gd php-mbstring php-pear mod_ssl
sudo cp php.ini /etc/php.ini

echo "main host"
sudo cp index.php /var/www/html/index.php
# <optional> sudo htpasswd -c /etc/httpd/conf/pwdfile hoangch
# pass 1234, no need -c for later
sudo cp pwdfile /etc/httpd/conf/pwdfile
sudo mkdir -p /var/www/html/auth-basic
sudo cp index-auth.html /var/www/html/auth-basic/index.html

echo "all hosts"
sudo cp vhost.conf /etc/httpd/conf.d/vhost.conf
sudo mkdir -p /www/myhost
sudo chcon -R -t httpd_sys_content_t /www/myhost
sudo cp index-myhost.html /www/myhost/index.html

echo "alias"
sudo mkdir -p /var/www/html/alias/1/2/3/4
sudo cp alias /var/www/html/alias/1/2/3/4/alias

echo "ssl"
#sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout web.key -out web.crt
# for myhost.vt only
#sudo cp web.crt /etc/pki/tls/private/server.crt
#sudo cp web.key /etc/pki/tls/private/server.key
#sudo cp ssl.conf /etc/httpd/conf.d/ssl.conf

echo "restart"
sudo systemctl restart httpd

echo "trust"
# can do on other linux servers
openssl s_client -connect a1.vt:443 <<<'' | \
    sudo openssl x509 -out /etc/pki/ca-trust/source/anchors/a1.crt
sudo update-ca-trust enable
sudo update-ca-trust extract

echo "mariadb"
sudo yum install -y mariadb-server mariadb php-mysqlnd
sudo systemctl start mariadb
mysql -sfu root < mariadb_setup.sql

echo "wordpress"
sudo yum install -y tar
sudo tar -zxvf wordpress-5.2.15-vi.tar.gz -C /www 1>/dev/null
sudo chcon -R -t httpd_sys_content_t /www/wordpress
sudo cp wp-config.php /www/wordpress/wp-config.php

echo "restart"
sudo systemctl restart httpd
