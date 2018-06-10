#!/bin/bash
#this script will create, curl and unpack a client bundle

if [ -z ${DTR_URL+x} ]; then
  echo Setting variables for you...
  . ./var_setup.sh
fi

export NAMESPACE="ci"
export REPO="dc18"
export ROLE="demo"

# enable DCT
export DOCKER_CONTENT_TRUST=1

#push signed image
docker pull alpine
docker tag alpine ${DTR_URL}/${NAMESPACE}/${REPO}:signed
docker push ${DTR_URL}/${NAMESPACE}/${REPO}:signed
