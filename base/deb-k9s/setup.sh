#!/bin/bash

kubectl apply -f components.yaml

sudo apt install curl -y
curl -sS https://webinstall.dev/k9s | bash
