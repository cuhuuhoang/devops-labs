#!/bin/bash

kubectl -n registry delete deploy/registry-init
kubectl -n registry apply -f private-registry.yaml
kubectl -n registry apply -f private-registry-svc.yaml
