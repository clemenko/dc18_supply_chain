#!/bin/bash
#create promition policy
# requires environment variables: DTR_HOST, DTR_USERNAME and DTR_TOKEN

if [ -z ${DTR_TOKEN+x} ]; then
  echo " Please create a DTR_TOKEN variable before preceeding..."
  exit
fi

curl -X POST -sk -L \
  -u $DTR_USERNAME:$DTR_TOKEN \
   https://$DTR_URL/api/v0/repositories/ci/dc18_build/promotionPolicies?initialEvaluation=true \
  -H 'Content-Type: application/json' \
  -d '{
  "enabled": true,
  "rules": [ { "field": "vulnerability_critical", "operator": "lte", "values": [ "0" ] } ],
  "tagTemplate": "%n",
  "targetRepository": "ci/dc18"
}'

echo ""
