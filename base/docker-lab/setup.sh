#!/bin/bash

base="/home/hoangch/code"
local_php="$base/php"
docker_php="/www/php"
local_db="$base/db"
httpd_dir="/home/hoangch/httpd"

mkdir -p "$base"
mkdir -p "$local_php"
cp index.php "$local_php"/.
echo "wordpress"
sudo yum install -y tar
rm -rf "$base"/wordpress || true
tar -zxvf wordpress-5.9.3.tar.gz -C "$base" 1>/dev/null
cp wp-config.php "$base"/wordpress/wp-config.php
#rm -rf "$local_php" || true
#mv "$base"/wordpress "$local_php"

docker network create --driver bridge www-net || true
echo "php"
docker stop c-php || true
docker rm c-php || true
docker build -t base-php --force-rm -f php.Dockerfile .
docker run -d --network www-net --name c-php -h php \
	-v "$local_php":"$docker_php" \
	-v "$base"/wordpress:"/www/wordpress" base-php

echo "httpd"
docker stop c-httpd || true
docker rm c-httpd || true
docker build -t php-httpd --force-rm -f httpd.Dockerfile .
docker run -d --network www-net -p 80:80 \
	--name c-httpd -h httpd -v "$local_php":"$docker_php" \
	-v "$httpd_dir":"/root/conf" \
	-v "$base"/wordpress:"/www/wordpress" php-httpd


echo "mariadb"
docker stop c-mariadb || true
docker rm c-mariadb || true
docker build -t php-mariadb --force-rm -f maria.Dockerfile .
docker run -d --network www-net --name c-mariadb -h mariadb \
        -v "$local_db":/var/lib/mysql \
	-e MARIADB_ROOT_PASSWORD=abc123 \
	-e MARIADB_DATABASE=wordpress \
	-e MARIADB_USER=wordpress_admin \
	-e MARIADB_PASSWORD=pass123 \
	php-mariadb

