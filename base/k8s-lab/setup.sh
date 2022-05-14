#!/bin/bash


#kubectl delete -f httpd-test.yaml
#kubectl delete replicaset.apps/hello-rs

#kubectl apply -f httpd-test.yaml
#kubectl port-forward pod/hello-kube-production 3000:80 --address='0.0.0.0'
#kubectl apply -f httpd-rc.yaml
#kubectl apply -f httpd-rs.yaml

kubectl label nodes a1.vt disk=ssd
kubectl label nodes a2.vt disk=ssd
kubectl label nodes a3.vt disk=ssd

kubectl apply -f daemon-monitor-virt.yaml
