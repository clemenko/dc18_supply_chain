#!/bin/bash
#this script will create, curl and unpack a client bundle

if [ -z ${DTR_URL+x} ]; then
  echo Setting variables for you...
  . ~/dc18_supply_chain/scripts/var_setup.sh
fi

export NAMESPACE="ci"
export REPO="dc18"
export ROLE="demo"

# disable DCT
export DOCKER_CONTENT_TRUST=0

#push signed image
docker pull ${DTR_URL}/${NAMESPACE}/${REPO}:promoted
docker tag ${DTR_URL}/${NAMESPACE}/${REPO}:promoted ${DTR_URL}/${NAMESPACE}/${REPO}:signed

#enable DCT
export DOCKER_CONTENT_TRUST=1
docker push ${DTR_URL}/${NAMESPACE}/${REPO}:signed
