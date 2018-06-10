#!/bin/bash
#create promition policy
# requires environment variables: DTR_HOST, DTR_USERNAME and DTR_TOKEN

if [ -z ${DTR_TOKEN+x} ]; then
  echo " Please create a DTR_TOKEN variable before preceeding..."
  exit
fi

curl -X POST -k -L \
  -u $DTR_USERNAME:$DTR_TOKEN \
   https://dtr.dockr.life/api/v0/repositories/ci/dc18_build \
  -H 'Content-Type: application/json' \
  -d '{
  "enabled": true,
  "rules": [ { "field": "vulnerability_critical", "operator": "lte", "values": [ "0" ] } ],
  "tagTemplate": "%n",
  "targetRepository": "ci/dc18"
}'
