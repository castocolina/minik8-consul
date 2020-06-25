#!/bin/zsh
BASEDIR=$(dirname "$0")
sudo echo "Test sudo"

source $BASEDIR/s00_common.zsh

CONSUL_VERSION=1.8.0
CONSUL_TEMPLATE_VERSION=0.25.0

CONSUL_FNAME=consul_${CONSUL_VERSION}_${K8_HOST_OS}_amd64.zip
CONSUL_URL="https://releases.hashicorp.com/consul/${CONSUL_VERSION}/$CONSUL_FNAME"
CONSUL_TEMPLATE_FNAME=consul-template_${CONSUL_TEMPLATE_VERSION}_${K8_HOST_OS}_amd64.tgz
CONSUL_TEMPLATE_URL="https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/$CONSUL_TEMPLATE_FNAME"

mkdir -p /tmp/consul

{ type "consul" &> /dev/null && echo "'consul' is INSTALLED!"; } || \
{
  echo "'consul' Not INSTALLED!";
  curl -o /tmp/consul/$CONSUL_FNAME -fSL $CONSUL_URL;
  unzip /tmp/consul/$CONSUL_FNAME -d /tmp/consul;
  ls -la /tmp/consul;
  sudo mv -v /tmp/consul/consul /usr/local/bin;
  rm /tmp/consul/$CONSUL_FNAME;
}

{ type "consul-template" &> /dev/null && echo "'consul-template' is INSTALLED!"; } || \
{
  echo "'consul-template' Not INSTALLED!";
  curl -o /tmp/consul/$CONSUL_TEMPLATE_FNAME -fSL $CONSUL_TEMPLATE_URL;
  tar -zvxf /tmp/consul/$CONSUL_TEMPLATE_FNAME --directory /tmp/consul;
  ls -la /tmp/consul;
  sudo mv -v /tmp/consul/consul-template /usr/local/bin;
  rm /tmp/consul/$CONSUL_TEMPLATE_FNAME;
}

{ type "jq" &> /dev/null && echo "'jq' is INSTALLED!"; } || \
{
  echo "'jq' Not INSTALLED!";
  brew install jq
}

{ type "yq" &> /dev/null && echo "'yq' is INSTALLED!"; } || \
{
  echo "'yq' Not INSTALLED!";
  brew install yq
}

{ type "bat" &> /dev/null && echo "'bat' is INSTALLED!"; } || \
{
  echo "'bat' Not INSTALLED!";
  brew install bat
}
