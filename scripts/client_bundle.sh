#!/bin/bash
#this script will create, curl and unpack a client bundle

if [ -z ${UCP_URL+x} ]; then
  echo Setting variables for you...
  . ./scripts/var_setup.sh
fi

AUTHTOKEN=$(curl -sk -d '{"username":"admin","password":"admin1234"}' https://$UCP_URL/auth/login | jq -r .auth_token)
curl -sk -H "Authorization: Bearer $AUTHTOKEN" https://$UCP_URL/api/clientbundle -o bundle.zip
unzip bundle.zip > /dev/null 2>&1
