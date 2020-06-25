#!/bin/zsh

BASEDIR=$(dirname "$0")
source $BASEDIR/s00_common.zsh

printf "$CONSOLE_OUT_SEP_STR\n\n"

SERVER_PREFIX=https://$(minikube ip -p $K8_PROFILE_NAME)


echo
echo
kubectl get pods

echo
minikube service list -p $K8_PROFILE_NAME

echo
