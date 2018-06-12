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

mkdir clientbundle
cd clientbundle
AUTHTOKEN=$(curl -sk -d '{"username":"admin","password":"admin1234"}' https://$UCP_URL/auth/login | jq -r .auth_token)
curl -sk -H "Authorization: Bearer $AUTHTOKEN" https://$UCP_URL/api/clientbundle -o bundle.zip
unzip bundle.zip > /dev/null 2>&1
curl -sk https://$controller1/ca > ucp-ca.pem
eval "$(<env.sh)" > /dev/null 2>&1

docker stack deploy -c ~/dc18_supply_chain/jenkins/jenkins.yml jenkins
echo "===================================================================================================================="
echo "  Jenkins URL is going to be : http://$DOCS_URL:8080"
echo "===================================================================================================================="
echo " Wait for the Jenkins Admin key and then hit Ctrl-C."
read -p "Press any key..."
sleep 5
docker logs -f $(docker ps|grep jenkins|awk '{print $1}')
