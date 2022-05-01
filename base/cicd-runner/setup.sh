#!/bin/bash

if [ ! -f "gitlab-runner_amd64.rpm" ]; then
	curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/rpm/gitlab-runner_amd64.rpm"
fi
sudo rpm -i "gitlab-runner_amd64.rpm"
sudo cp config.toml /etc/gitlab-runner/config.toml
sudo gitlab-runner restart
#?
#sudo systemctl restart firewalld
#sudo firewall-cmd --permanent --add-port=2375/tcp
#sudo firewall-cmd --reload
