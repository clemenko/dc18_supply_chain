#!/bin/bash

if [ -z ${DTR_URL+x} ]; then
  echo Setting variables for you...
  . ./var_setup.sh
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
docker pull clemenko/dc18:bad
#tag
docker tag clemenko/dc18:0.1 $DTR_URL/ci/dc18_build:0.1
docker tag clemenko/dc18:0.2 $DTR_URL/ci/dc18_build:0.2
docker tag clemenko/dc18:bad $DTR_URL/ci/dc18_build:bad
#push
docker push $DTR_URL/ci/dc18_build:0.1
docker push $DTR_URL/ci/dc18_build:0.2
docker push $DTR_URL/ci/dc18_build:bad
