#!/bin/bash

set -e
set -x

kubectl apply -f crd.yaml
kubectl apply -f rbac.yaml -n kube-system

# daemonset方式部署
kubectl apply -f daemonset/config.yaml -n kube-system

kubectl label nodes k8s-node-01 TraefikProxy=true
kubectl get nodes --show-labels

kubectl apply -f daemonset/daemonset.yaml -n kube-system
kubectl apply -f traefik-dashboard-route.yaml -n kube-system
