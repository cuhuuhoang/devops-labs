#!/bin/bash

kubectl create namespace registry --dry-run=client -o yaml | kubectl apply -f -

kubectl -n registry apply -f registry-certs-storage.yaml
kubectl -n registry apply -f registry-data-storage.yaml
kubectl -n registry apply -f registry-init-deployment.yaml

echo "wait"
sleep 20s
pod=$(kubectl -n registry get pods --no-headers -o custom-columns=":metadata.name" --selector app=registry-init)
echo "$pod"
ls certs | while read file; do kubectl -n registry cp certs/"$file" "$pod":/certs/"$file"; done

echo "servers"
echo "sudo cp registry.crt /etc/ssl/certs"

echo "local"
echo "sudo cp certs/registry.crt /etc/docker/certs.d/a1.vt:31320/ca.crt"
echo "sudo service docker restart"

echo "check cmt"
#for i in 1 2 3; do scp certs/registry.crt a"$i".vt:~/.; ssh a"$i".vt "sudo cp ~/registry.crt /etc/ssl/certs"; done
