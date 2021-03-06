#!/bin/bash

base="/home/hoangch/code"
local_php="$base/php"
local_wp="$base/wordpress"
docker_php="/www/php"
docker_wp="/www/wordpress"
local_db="$base/db"

mkdir -p "$local_php"
cp index.php "$local_php"/.
echo "wordpress"
sudo yum install -y tar
rm -rf "$local_wp" || true
tar -zxvf wordpress-5.9.3.tar.gz -C "$base" 1>/dev/null
cp wp-config.php "$local_wp"/wp-config.php

docker network create --driver bridge www-net || true
echo "php"
docker stop c-php || true
docker rm c-php || true
docker run -d --network www-net --name c-php -h php \
	-v "$local_php":"$docker_php" \
	-v "$local_wp":"$docker_wp" wp-php

echo "httpd"
docker stop c-httpd || true
docker rm c-httpd || true
docker run -d --network www-net -p 80:80 \
	--name c-httpd -h httpd -v "$local_php":"$docker_php" \
	-v "$local_wp":"$docker_wp" wp-httpd


echo "mariadb"
docker stop c-mariadb || true
docker rm c-mariadb || true
docker run -d --network www-net --name c-mariadb -h mariadb \
        -v "$local_db":/var/lib/mysql \
	-e MARIADB_ROOT_PASSWORD=abc123 \
	-e MARIADB_DATABASE=wordpress \
	-e MARIADB_USER=wordpress_admin \
	-e MARIADB_PASSWORD=pass123 \
	wp-mariadb

