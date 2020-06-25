#!/bin/zsh

BASEDIR=$(dirname "$0")

helm init --wait

helm repo add hashicorp https://helm.releases.hashicorp.com

# helm install -f manifest/helm-consul-values.yaml --name hashicorp hashicorp/consul
helm install -f manifest/helm-consul-values.yaml --name hashicorp hashicorp/consul --namespace consul-system
