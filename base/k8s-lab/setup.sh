#!/bin/bash


#kubectl delete -f httpd-test.yaml
#kubectl delete replicaset.apps/hello-rs

#kubectl apply -f httpd-test.yaml
#kubectl port-forward pod/hello-kube-production 3000:80 --address='0.0.0.0'
#kubectl apply -f httpd-rc.yaml
#kubectl apply -f httpd-rs.yaml

#kubectl label nodes a1.vt disk=ssd
#kubectl label nodes a2.vt disk=ssd
#kubectl label nodes a3.vt disk=ssd

#kubectl apply -f daemon-monitor-virt.yaml

#kubectl apply -f redis-cluster-ip.yaml
#kubectl apply -f redis-consumer.yaml

#kubectl apply -f node-port.yaml


#deployment
#kubectl apply -f hello-deployment.yaml
#kubectl set image deployment hello-app hello-app=080196/hello-app:v2
#kubectl rollout status deploy hello-app
#kubectl rollout history deploy hello-app
#kubectl rollout undo deployment hello-app --to-revision=2


#forward port
#kubectl port-forward fortune 8080:80
#kubectl port-forward service/uweb 8080:8080 --address='0.0.0.0'

#check env
#kubectl exec -it hello-env -- sh
#env | grep PORT


#downward
#kubectl apply -f downward-api-env.yaml
#kubectl exec downward main -- env
#kubectl apply -f downward-api-volume.yaml
#kubectl exec downward-volume -- ls -lL /etc/downward
#kubectl exec downward-volume -- cat /etc/downward/podName

#api
#kubectl cluster-info
#kubectl proxy
#curl http://127.0.0.1:8001/api/v1/namespaces/default/pods

#top
#kubectl exec -it requests-pod top

#metrics
#kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
#kubectl top node
#kubectl top pod -A
#kubectl apply -f hpa-deploy.yaml
#kubectl apply -f hpa.yaml
