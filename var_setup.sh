#!/bin/bash
#setup PWD DTR Vars
export DTR_URL="$(curl -sS https://${PWD_HOST_FQDN}/sessions/${SESSION_ID} | jq -r '.instances[] | select(.hostname == "worker1") | .proxy_host').direct.${PWD_HOST_FQDN}"
export DTR_USERNAME=admin
export UCP_URL="$(curl -sS https://${PWD_HOST_FQDN}/sessions/${SESSION_ID} | jq -r '.instances[] | select(.hostname == "manager1") | .proxy_host').direct.${PWD_HOST_FQDN}"
export DOCS_URL="$(curl -sS https://${PWD_HOST_FQDN}/sessions/${SESSION_ID} | jq -r '.instances[] | select(.hostname == "worker3") | .proxy_host').direct.${PWD_HOST_FQDN}"
export NOTARY_OPTS="-d ${HOME}/.docker/trust -s https://${DTR_URL} --tlscacert /usr/local/share/ca-certificates/${DTR_URL}.crt"
export PATH=$PATH:/root/dc18_supply_chain/
