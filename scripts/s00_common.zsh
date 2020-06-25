#!/bin/zsh

BASEDIR=$(dirname "$0")

export K8_PROFILE_NAME=minik8-consul
export K8_NAMESPACE=consul
export K8_CONSUL_NAMESPACE=consul-system
export K8_MINIK_RAM_MB=4GB
export K8_MINIK_CPU_NUM=3
export K8_MINIK_DISK=30GB
export K8_LOG_LEVEL=1
export K8_API_VERSION=v1.16.11
export K8_MANIFEST_ROOT_PATH=$BASEDIR/../manifests
export K8_MINIKUBE_DRIVER=virtualbox ## virtualbox, hyperkit
export CONSOLE_OUT_SEP_STR="========================================================================================================================"


function wait_time(){
	secs=$1
	while [ $secs -gt 0 ]; do
	   echo -ne "    WAIT $secs\033[0K\r"
	   sleep 1
	   : $((secs--))
	done
}

export K8_HOST_OS=$(uname -s | tr '[:upper:]' '[:lower:]')
if [ "$K8_HOST_OS" = "darwin" ]; then
  export K8_MINIKUBE_DRIVER=hyperkit
fi
if [ "$K8_HOST_OS" = "linux" ]; then
  export K8_MINIKUBE_DRIVER=kvm2
fi

kubectx $K8_PROFILE_NAME
# kubens $K8_NAMESPACE

export MONGO_INITDB_ROOT_USERNAME=admin
export MONGO_INITDB_ROOT_PASSWORD="admin123456"
# export MONGO_URL="mongodb://$MONGO_INITDB_ROOT_USERNAME:$MONGO_INITDB_ROOT_PASSWORD@kodos-mongo-db/clients"
export MONGO_URL="mongodb://kodos-mongo-db/clients"
