#!/bin/bash

. ../settings.sh
. ../env.sh

sudo yum -y install keepalived

cat keepalived.conf.template | \
	sed "s/\$\$keepalived_state/$keepalived_state/g" | \
	sed "s/\$\$keepalived_priority/$keepalived_priority/g" > keepalived.conf
sudo cp keepalived.conf /etc/keepalived/keepalived.conf
sudo cp sysctl.conf /etc/sysctl.conf
sudo sysctl -p
sudo systemctl restart keepalived
