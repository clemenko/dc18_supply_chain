#!/bin/bash
#this script will NOTARY!

if [ -z ${UCP_URL+x} ]; then
  echo Setting variables for you...
  . ./var_setup.sh
fi

AUTHTOKEN=$(curl -sk -d '{"username":"admin","password":"admin1234"}' https://$UCP_URL/auth/login | jq -r .auth_token)
curl -sk -H "Authorization: Bearer $AUTHTOKEN" https://$UCP_URL/api/clientbundle -o bundle.zip
unzip bundle.zip > /dev/null 2>&1

notary -s https://$DTR_URL -d ~/.docker/trust --tlscacert /usr/local/share/ca-certificates/ip172-18-0-24-bcd8s0ddffhg00b2o320.direct.ee-beta2.play-with-docker.com.crt
