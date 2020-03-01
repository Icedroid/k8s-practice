#!/bin/bash

# wget https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc5/aio/deploy/recommended.yaml
# mv recommended.yaml kubernetes-dashboard.yaml

# 创建自签名证书
# openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=dashboard.k8s.vm"

# 将证书存储到 Kubernetes Secret 中
kubectl create secret tls kubernetes-dashboard-tls --key=tls.key --cert=tls.crt -n kube-system

# 安装kubernetes-dashboard
kubectl apply -f kubernetes-dashboard.yaml

# 安装traefik route
kubectl apply -f kubernetes-dashboard-route.yaml -n kubernetes-dashboard

# 生成cluster-admin角色的ServiceAccount
kubectl create -f admin-role.yaml

secret=$(kubectl get sa admin -n kube-system -o json | jq -r .secrets[].name)
#获取token Linux 中base64 -d 表示解码，Mac 中使用 base64 -D
token=$(kubectl get secret ${secret} -n kube-system -o jsonpath={.data.token} | base64 -D)
echo $token
# 或
# # describe获取后的是经过base64解码的
# kubectl describe secret admin-token-sw6rj -n kube-system

#使用token在dash可登录
