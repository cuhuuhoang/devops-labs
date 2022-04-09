#!/bin/bash

docker build -t wp-php --force-rm -f php.Dockerfile .
docker build -t wp-httpd --force-rm -f httpd.Dockerfile .
docker build -t wp-mariadb --force-rm -f maria.Dockerfile .

