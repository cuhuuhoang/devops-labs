#!/bin/bash

cp id_rsa_nearlytech ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
cp id_rsa_nearlytech.pub ~/.ssh/authorized_keys
chmod 644 ~/.ssh/authorized_keys

sudo systemctl restart sshd

#for i in {1..3}; do
#	ssh -o StrictHostKeyChecking=no "a$i.vt" uname -n
#done
