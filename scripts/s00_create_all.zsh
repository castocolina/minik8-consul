#!/bin/zsh

BASEDIR=$(dirname "$0")

source $BASEDIR/s01_0_minikube-start.zsh;
# source $BASEDIR/s02_install_crd.zsh; 
source $BASEDIR/s02_install_consul.zsh;
source $BASEDIR/s03_create_namespace.zsh;
# source $BASEDIR/s04_create_consul_secret.zsh;
# source $BASEDIR/s05_deploy_queue.zsh; 
# source $BASEDIR/s06_deploy_cache.zsh;
# source $BASEDIR/s07_0_deploy_database_pgsql.zsh;
# source $BASEDIR/s07_0_deploy_database_mssql.zsh;
# source $BASEDIR/s07_0_deploy_database_mongo_single.zsh;
# source $BASEDIR/s08_0_deploy_observability.zsh;
source $BASEDIR/s20_urls.zsh;
# source $BASEDIR/s00_stats.zsh;

echo
kubectl get pod -A
