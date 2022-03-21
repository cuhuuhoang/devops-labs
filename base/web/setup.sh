#!/bin/bash

. ../settings.sh
. ../env.sh

echo "web"
sudo yum -y install httpd
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --reload
sudo rm -f /etc/httpd/conf.d/welcome.conf

echo "main host"
cat index.html.template | \
	sed "s/\$\$hostname/$hostname/g" > index.html
sudo cp index.html /var/www/html/index.html
sudo cp httpd.conf /etc/httpd/conf/httpd.conf

echo "restart"
sudo systemctl restart httpd
