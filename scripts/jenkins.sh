#!/bin/bash
#this script will create, curl and unpack a client bundle

if [ -z ${DOCS_URL+x} ]; then
  echo "Setting variables for you..."
  . ~/dc18_supply_chain/scripts/var_setup.sh
fi

jenkins_id=$(docker run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock clemenko/dc18:jenkins)

echo "========================================================================================================="
echo ""
echo "  Jenkins URL : http://$DOCS_URL:8080"
echo ""
echo "========================================================================================================="

echo -n "  Waiting for Jenkins to start."
for i in {1..15}; do echo -n "."; sleep 1; done
echo ""

echo "========================================================================================================="
echo ""
echo "  Jenkins Setup Password = "$(docker exec $jenkins_id cat /var/jenkins_home/secrets/initialAdminPassword)
echo ""
echo "========================================================================================================="
