#!/bin/bash

local_php="/home/hoangch/code/php"
docker_php="/www/php"
local_db="/home/hoangch/code/db"
httpd_dir="/home/hoangch/httpd"

docker network create --driver bridge www-net || true
echo "php"
mkdir -p "$local_php"
cp index.php "$local_php"
docker stop c-php || true
docker rm c-php || true
docker run -d --network www-net --name c-php -h php \
	-v "$local_php":"$docker_php" php:7.3-fpm

echo "httpd"
docker stop c-httpd || true
docker rm c-httpd || true

docker build -t php-httpd --force-rm -f httpd.Dockerfile .
docker run -d --network www-net -p 8080:80 \
	--name c-httpd -h httpd -v "$local_php":"$docker_php" \
	-v "$httpd_dir":"/root/conf" php-httpd


echo "mariadb"
docker stop c-mariadb || true
docker rm c-mariadb || true
echo "to remove this"
rm -rf "$local_db"

docker build -t php-mariadb --force-rm -f maria.Dockerfile .
docker run -d --network www-net --name c-mariadb -h mariadb \
        -v "$local_db":/var/lib/mysql \
	-e MARIADB_ROOT_PASSWORD=abc123 \
	-e MARIADB_DATABASE=wordpress \
	-e MARIADB_USER=wordpress_admin \
	-e MARIADB_PASSWORD=pass123 \
	php-mariadb

echo "wordpress"
sudo yum install -y tar
tar -zxvf wordpress-5.9.3.tar.gz -C "/home/hoangch/code" 1>/dev/null
sudo chcon -R -t httpd_sys_content_t "/home/hoangch/code/wordpress"
cp wp-config.php /home/hoangch/code/wordpress/wp-config.php
rm -rf /home/hoangch/code/php
mv /home/hoangch/code/wordpress /home/hoangch/code/php
