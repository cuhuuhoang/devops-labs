#!/bin/bash

mv id_rsa_nearlytech ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
mv id_rsa_nearlytech.pub ~/.ssh/authorized_keys
chmod 644 ~/.ssh/authorized_keys

sudo systemctl restart sshd
