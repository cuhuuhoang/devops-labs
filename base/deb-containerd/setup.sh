#!/bin/bash

sudo apt install gnupg -y

cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sudo sysctl --system

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" |sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update -y
sudo apt install containerd -y

sudo mkdir -p /etc/containerd
sudo cp config.toml /etc/containerd/config.toml

sudo systemctl restart containerd
ps -ef | grep containerd | grep -v grep
