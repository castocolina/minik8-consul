#!/bin/zsh

BASEDIR=$(dirname "$0")
source $BASEDIR/s00_common.zsh

export CONSUL_HTTP_ADDR=$(minikube service hashicorp-consul-ui --url -p $K8_PROFILE_NAME --namespace $K8_CONSUL_NAMESPACE)
export CONSUL_HTTP_TOKEN=
export ENVIRONMENT=dev
export CONSUL_HTTP_SSL=false
export CONSUL_HTTP_SSL_VERIFY=false

rm -rf tmp && mkdir -p tmp

consul-template -config consul/config.hcl \
    -template consul/templates/config.tmpl:tmp/$ENVIRONMENT.json \
    -template consul/templates/config-json.tmpl:tmp/${ENVIRONMENT}_2.json \
    -template consul/templates/config-yaml.tmpl:tmp/$ENVIRONMENT.yaml \
    -template consul/templates/config-prop.tmpl:tmp/$ENVIRONMENT.properties \
    -exec "zsh $BASEDIR/s07_process_client.zsh;"
