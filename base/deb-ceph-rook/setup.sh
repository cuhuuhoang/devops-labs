#!/bin/bash

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.7.1/cert-manager.yaml

sudo apt-get install -y lvm2 git
git clone --single-branch --branch v1.10.7 https://github.com/rook/rook.git

dir="rook/deploy/examples"

kubectl create -f "$dir"/crds.yaml -f "$dir"/common.yaml -f "$dir"/operator.yaml
kubectl create -f "$dir"/toolbox.yaml
#kubectl -n rook-ceph get pod

kubectl create -f "$dir"/cluster-test.yaml
kubectl create -f dashboard-external-https.yaml
kubectl -n rook-ceph get pod

echo "Dashboard pwd"
echo "kubectl -n rook-ceph get secret rook-ceph-dashboard-password -o jsonpath=\"{['data']['password']}\" | base64 --decode && echo"

echo "Check with"
echo "kubectl -n rook-ceph get pod"
echo "kubectl -n rook-ceph exec -it deploy/rook-ceph-tools -- bash"
