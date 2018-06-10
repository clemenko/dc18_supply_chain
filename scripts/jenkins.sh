#!/bin/bash
#this script will create, curl and unpack a client bundle

if [ -z ${DOCS_URL+x} ]; then
  echo "Setting variables for you..."
  . ~/dc18_supply_chain/scripts/var_setup.sh
fi

if [ ! -f ~/dc18_supply_chain/env.sh ]; then
  echo "Creating a client bundle for you..."
  . ~/dc18_supply_chain/scripts/client_bundle.sh
fi

if [ -z ${DOCKER_HOST+x} ]; then
  echo "Sourcing the client bundle for you..."
  . ~/dc18_supply_chain/env.sh
fi

docker stack deploy -c ~/dc18_supply_chain/jenkins/jenkins.yml jenkins
sleep 5
docker logs -f $(docker ps|grep jenkins|awk '{print $1}')
