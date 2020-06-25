#!/bin/zsh

BASEDIR=$(dirname "$0")
source $BASEDIR/s00_common.zsh

printf "$CONSOLE_OUT_SEP_STR\n\n"

# Basic config
kubectl apply --v=$K8_LOG_LEVEL -f $K8_MANIFEST_ROOT_PATH/namespace.yaml

