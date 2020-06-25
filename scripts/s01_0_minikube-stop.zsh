#!/bin/zsh

BASEDIR=$(dirname "$0")
source $BASEDIR/s00_common.zsh

# minikube stop --alsologtostderr -p $K8_PROFILE_NAME
printf "\n $CONSOLE_OUT_SEP_STR\n\n\n"

minikube stop --alsologtostderr --v $K8_LOG_LEVEL -p $K8_PROFILE_NAME
