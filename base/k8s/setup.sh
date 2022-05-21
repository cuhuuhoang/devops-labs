#!/bin/bash

echo "utils and firewall"
sudo yum install yum-utils nfs-utils bash-completion git -y
sudo systemctl disable firewalld --now

echo "some k8s config"
sudo cp modules-load-d-k8s.conf /etc/modules-load.d/k8s.conf
sudo cp sysctl-d-k8s.conf /etc/sysctl.d/k8s.conf
sudo sysctl --system

echo "crio config"
sudo cp modules-load-d-crio.conf /etc/modules-load.d/crio.conf
sudo modprobe overlay
sudo modprobe br_netfilter

sudo cp 99-kubernetes-cri.conf /etc/sysctl.d/99-kubernetes-cri.conf
sudo sysctl --system

echo "kubernete config"
sudo cp kubernetes.repo /etc/yum.repos.d/kubernetes.repo
sudo yum repolist -y

echo "swapoff"
sudo swapoff -a
sudo sed -i '/swap/d' /etc/fstab

echo "other repo"
OS="CentOS_8"
sudo curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable.repo \
	"https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/devel:kubic:libcontainers:stable.repo"

VERSION="1.20"
sudo curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.repo \
	"https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$VERSION/$OS/devel:kubic:libcontainers:stable:cri-o:$VERSION.repo"

echo "install"
sudo yum install cri-o -y
sudo yum install -y kubelet-1.20.0-0 kubeadm-1.20.0-0 kubectl-1.20.0-0 --disableexcludes=kubernetes

sudo cp 10-kubeadm.conf /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf

echo "starting"
sudo systemctl daemon-reload
sudo cp crio-settings /etc/sysconfig/crio
sudo systemctl enable crio --now
sudo systemctl enable kubelet --now
sudo cp ip_forward /proc/sys/net/ipv4/ip_forward

exit 0

echo "start cluster on admin only"
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "Calico plugin"
kubectl apply -f calico.yaml
