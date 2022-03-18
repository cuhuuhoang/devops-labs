#!/bin/bash

. settings.sh
. env.sh

# should be called from base dir
sudo yum install -y bind-utils
cat network/ifcfg-ens160.template | \
	sed "s/\$\$ipaddr/$ipaddr/g" | \
	sed "s/\$\$dns/$dns/g" > network/ifcfg-ens160
sudo cp network/ifcfg-ens160 /etc/sysconfig/network-scripts/ifcfg-ens160
sudo systemctl restart NetworkManager
sleep 1
nslookup google.com >/dev/null && echo "network is good" || \
	echo "NETWORK DOESN'T WORK"
