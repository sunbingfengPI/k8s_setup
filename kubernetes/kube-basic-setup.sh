#!/bin/bash

declare -A imagesMap=()

# sys basic
imagesMap[pause-amd64:3.0]=siriuszg/pause-amd64:3.0
imagesMap[kube-addon-manager:v6.4-beta.2]=sneaxiy/kube-addon-manager-v6.4-beta.2

#kube-dns
imagesMap[k8s-dns-kube-dns-amd64:1.14.5]=radishgz/k8s-dns-kube-dns-amd64
imagesMap[k8s-dns-sidecar-amd64:1.14.5]=oceanbow/k8s-dns-sidecar-amd64-1.14.5:1.14.5
imagesMap[k8s-dns-dnsmasq-nanny-amd64:1.14.5]=toby82/k8s-dns-dnsmasq-nanny-amd64-1.14.5

#kube-dashboard
imagesMap[kubernetes-dashboard-amd64:v1.7.0]=siriuszg/kubernetes-dashboard-amd64:v1.7.0
imagesMap[kubernetes-dashboard-amd64:v1.7.1]=oceanbow/kubernetes-dashboard-amd64-v1.7.1:v1.7.1
imagesMap[kubernetes-dashboard-init-amd64:v1.0.1]=bestci/kubernetes-dashboard-init-amd64:v1.0.1

#k8s master
imagesMap[kube-apiserver-amd64:v1.8.0]=oceanbow/kube-apiserver-amd64-v1.8.0:v1.8.0
imagesMap[kube-controller-manager-amd64:v1.8.0]=oceanbow/kube-controller-manager-amd64-v1.8.0:v1.8.0
imagesMap[kube-scheduler-amd64:v1.8.0]=oceanbow/kube-scheduler-amd64-v1.8.0:v1.8.0
imagesMap[etcd-amd64:3.0.17]=sylzd/etcd-amd64-3.0.17
imagesMap[exechealthz-amd64:v1.2.0]=fearchan/exechealthz-amd64:v1.2.0
imagesMap[kube-discovery-amd64:1.0]=cloudnil/kube-discovery-amd64:1.0
imagesMap[kube-proxy-amd64:v1.8.0]=oceanbow/kube-proxy-amd64-v1.8.0:v1.8.0

for imageName in ${!imagesMap[@]} ; do
  echo starting to install $imageName
  docker pull ${imagesMap[$imageName]}
  docker tag ${imagesMap[$imageName]} gcr.io/google_containers/$imageName
  docker rmi ${imagesMap[$imageName]}
done
