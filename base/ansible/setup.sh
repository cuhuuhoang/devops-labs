#!/bin/bash

echo "install ansible"
sudo yum install -y epel-release
sudo yum install -y ansible

sudo cp hosts /etc/ansible/hosts

#ansible all -m ping
#ansible all -m command -a "uptime"
#ansible all -m setup -a 'filter=ansible_distribution'
#ansible all -m setup -a 'filter=ansible_default_ipv4'

ansible-playbook -i /etc/ansible/hosts playbook-pre.yml
ansible-playbook -i /etc/ansible/hosts playbook-wordpress.yml
