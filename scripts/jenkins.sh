#!/bin/bash
#this script will create, curl and unpack a client bundle

if [ -z ${DOCS_URL+x} ]; then
  echo Setting variables for you...
  . ./scripts/var_setup.sh
fi

if [ ! -f env.sh ]; then
  echo Creating a client bundle for you...
  . ./scripts/client_bundle.sh
fi

if [ -z ${DOCKER_HOST+x} ]; then
  echo Sourcing the client bundle for you...
  . ./env.sh
fi
