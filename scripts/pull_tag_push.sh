#!/bin/bash
#this script will pull, tag and push images for PWD.

if [ -z ${DTR_URL+x} ]; then
  echo Setting variables for you...
  . ~/dc18_supply_chain/scripts/var_setup.sh
fi

if [ -z ${DTR_TOKEN+x} ]; then
  echo " Please create a DTR_TOKEN variable before preceeding..."
  exit
fi

#login
docker login -u jenkins -p $DTR_TOKEN $DTR_URL
#pull
docker pull clemenko/dc18:0.1
docker pull clemenko/dc18:0.2
docker pull clemenko/dc18:0.3
docker pull alpine
#tag
docker tag clemenko/dc18:0.1 $DTR_URL/ci/dc18_build:0.1
docker tag clemenko/dc18:0.2 $DTR_URL/ci/dc18_build:0.2
docker tag clemenko/dc18:0.3 $DTR_URL/ci/dc18_build:0.3
docker tag alpine $DTR_URL/ci/dc18_build:alpine
#push
docker push $DTR_URL/ci/dc18_build:0.1
docker push $DTR_URL/ci/dc18_build:0.2
docker push $DTR_URL/ci/dc18_build:0.3
docker push $DTR_URL/ci/dc18_build:alpine
