#!/bin/zsh

BASEDIR=$(dirname "$0")
source $BASEDIR/s00_common.zsh

minikube addons disable heapster --v=$K8_LOG_LEVEL -p $K8_PROFILE_NAME
minikube addons enable dashboard --v=$K8_LOG_LEVEL -p $K8_PROFILE_NAME

echo
wait_time 5
echo

minikube dashboard --url --v=$K8_LOG_LEVEL -p $K8_PROFILE_NAME
