#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "need an argument"
	exit 1
fi

if [ "$1" == "first" ]; then
	echo "first time"
	sudo yum -y install httpd
	sudo firewall-cmd --permanent --add-port=80/tcp
	sudo firewall-cmd --reload
	sudo rm -f /etc/httpd/conf.d/welcome.conf
	sudo yum -y install php php-mbstring php-pear
fi
if [ "$1" == "basic" ]; then
	echo "basic"
	sudo cp httpd.conf /etc/httpd/conf/httpd.conf
	sudo cp php.ini /etc/php.ini
	sudo cp index.php /var/www/html/index.php
fi
if [ "$1" == "auth" ]; then
	echo "auth"
	# <optional> sudo htpasswd -c /etc/httpd/conf/pwdfile hoangch
	# pass 1234, no need -c for later
	sudo cp pwdfile /etc/httpd/conf/pwdfile
	sudo cp auth_basic.conf /etc/httpd/conf.d/auth_basic.conf
	sudo mkdir -p /var/www/html/auth-basic
	sudo cp index-auth.html /var/www/html/auth-basic/index.html
fi
if [ "$1" == "vhost" ]; then
	echo "vhost"
	sudo cp vhost.conf /etc/httpd/conf.d/vhost.conf
	sudo cp vhost1.conf /etc/httpd/conf.d/vhost1.conf
	sudo mkdir -p /var/www/myhost
	sudo cp index-myhost.html /var/www/myhost/index.html
fi
sudo systemctl restart httpd
