#!/bin/zsh

echo
echo
echo "CLIENT START! $(date)"

if [ -z "$ENVIRONMENT" ]; then
      echo "    EXPORT ENVIRONMENT"
      exit 1;
fi
echo
echo $ENVIRONMENT
echo 

#jq parse, validate, format & show pretty json 

bat --paging=never tmp/${ENVIRONMENT}.json tmp/${ENVIRONMENT}_2.json tmp/${ENVIRONMENT}.properties tmp/${ENVIRONMENT}.yaml

secs=1
while :
do
      echo -ne "    WAIT ${secs}s\033[0K\r"
      sleep 1
      : $((secs++))
done
