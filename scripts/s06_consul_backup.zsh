#!/bin/zsh

BASEDIR=$(dirname "$0")
source $BASEDIR/s00_common.zsh


## https://www.consul.io/docs/commands

export CONSUL_HTTP_ADDR=$(minikube service hashicorp-consul-ui --url -p $K8_PROFILE_NAME --namespace $K8_CONSUL_NAMESPACE)
export CONSUL_HTTP_TOKEN=
export ENVIRONMENT=local

consul kv export > consul/backup.json

cat consul/backup.json | jq
