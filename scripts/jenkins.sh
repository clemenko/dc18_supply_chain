#!/bin/bash
#this script will create, curl and unpack a client bundle

if [ -z ${DOCS_URL+x} ]; then
  echo "Setting variables for you..."
  . ~/dc18_supply_chain/scripts/var_setup.sh
fi

docker run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock clemenko/dc18:jenkins

echo "===================================================================================================================="
echo "  Jenkins URL is going to be : http://$DOCS_URL:8080"
echo "===================================================================================================================="
echo " Waiting for Jenkins to start...
sleep 5
echo "===================================================================================================================="
echo "  Jenkins Setup Password = "$(docker exec $(docker ps|grep jenkins|awk '{print $1}') cat /var/jenkins_home/secrets/initialAdminPassword)
