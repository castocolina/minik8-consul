#!/bin/zsh

BASEDIR=$(dirname "$0")
source $BASEDIR/s00_common.zsh

# minikube stop --alsologtostderr -p $K8_PROFILE_NAME
printf "\n $CONSOLE_OUT_SEP_STR\n\n\n"

# minikube config set kubernetes-version $K8_API_VERSION
minikube config set vm-driver $K8_MINIKUBE_DRIVER

# --memory 4096 --cpus 4
# --gpu --vm-driver=kvm2 --vm-driver=hyperkit
minikube start --alsologtostderr --v $K8_LOG_LEVEL -p $K8_PROFILE_NAME \
    --memory $K8_MINIK_RAM_MB --cpus $K8_MINIK_CPU_NUM --disk-size $K8_MINIK_DISK \
    --vm-driver $K8_MINIKUBE_DRIVER --kubernetes-version $K8_API_VERSION

echo
echo 
wait_time 10
echo

minikube addons enable ingress --v=$K8_LOG_LEVEL -p $K8_PROFILE_NAME
minikube addons enable metrics-server --v=$K8_LOG_LEVEL -p $K8_PROFILE_NAME

printf "\n\n$CONSOLE_OUT_SEP_STR\n ::: kubectl:\n "
kubectl version --client --short
printf "\n ::: minikube:\n "
minikube version
printf "$CONSOLE_OUT_SEP_STR\n\n"

printf "\n\n $CONSOLE_OUT_SEP_STR\n ::: KUBE IP\n\n"
echo "$(minikube ip --v=$K8_LOG_LEVEL -p $K8_PROFILE_NAME)"
echo "PATH HTTP: http://$(minikube ip -p $K8_PROFILE_NAME)"
echo "PATH HTTPS: https://$(minikube ip -p $K8_PROFILE_NAME)"
printf "\n $CONSOLE_OUT_SEP_STR\n\n"
