#!/bin/bash


sudo apt-get install curl -y

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add

cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update -y
sudo apt-get install -y kubelet kubeadm kubectl ufw

if [ $(hostname) == "a1.vt" ]; then

sudo ufw allow 6443/tcp
sudo ufw allow 2379/tcp
sudo ufw allow 2380/tcp
sudo ufw allow 10250/tcp
sudo ufw allow 10251/tcp
sudo ufw allow 10252/tcp
sudo ufw allow 10255/tcp
sudo ufw reload

else

sudo ufw allow 10251/tcp
sudo ufw allow 10255/tcp
sudo ufw reload

fi

sudo swapoff -a
sudo systemctl enable kubelet

#then init
#https://www.hostafrica.ng/blog/servers/kubernetes-cluster-debian-11-containerd/
#kubeadm init --pod-network-cidr=10.244.0.0/16
