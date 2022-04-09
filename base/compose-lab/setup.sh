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
mkdir -p "$local_db"

docker-compose up
