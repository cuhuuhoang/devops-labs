#!/bin/bash


kubectl create -f filesystem.yaml
kubectl -n rook-ceph get pod -l app=rook-ceph-mds
echo "check with"
echo "kubectl -n rook-ceph get pod -l app=rook-ceph-mds"
echo "#https://rook.io/docs/rook/v1.10/Storage-Configuration/Shared-Filesystem-CephFS/filesystem-storage/#create-the-filesystem"
echo "kubectl -n rook-ceph exec -it deploy/rook-ceph-tools -- bash"
echo "ceph status"
echo
echo "kubectl create -f storageclass.yaml"
