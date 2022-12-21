#!/bin/bash

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.7.1/cert-manager.yaml

sudo apt-get install -y lvm2 git

ssh -o StrictHostKeyChecking=no a2.vt "sudo apt-get install -y lvm2"
ssh -o StrictHostKeyChecking=no a3.vt "sudo apt-get install -y lvm2"

git clone --single-branch --branch v1.10.7 https://github.com/rook/rook.git

dir="rook/deploy/examples"

kubectl create -f "$dir"/crds.yaml -f "$dir"/common.yaml -f "$dir"/operator.yaml

echo "wait until ok"
echo "kubectl -n rook-ceph get pod"

echo "kubectl create -f base/deb-ceph-rook/$dir/cluster-test.yaml -f base/deb-ceph-rook/$dir/toolbox.yaml -f base/deb-ceph-rook/dashboard-external-https.yaml"

echo "Wait again"
echo "kubectl -n rook-ceph get pod"

echo "Dashboard pwd"
echo "kubectl -n rook-ceph get secret rook-ceph-dashboard-password -o jsonpath=\"{['data']['password']}\" | base64 --decode && echo"

echo "Check with"
echo "kubectl -n rook-ceph get pod"
echo "kubectl -n rook-ceph exec -it deploy/rook-ceph-tools -- bash"
