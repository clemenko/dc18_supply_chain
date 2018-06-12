#Setup

This implies superjenkins from : https://github.com/clemenko/dockerfiles/blob/master/jenkins.Dockerfile

Create a directory and copy the nginx.conf and jenkins-nginx.yml to it.
`mkdir -p jenkins/{certs,data,ssh}; chmod -R 777 jenkins; cd jenkins`

##Now create a cert : (change the domain)
`cd certs; openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes -subj "/C=US/ST=MD/O=Docker/CN=192.168.233.141.xip.io"`

##init the swarm
`docker swarm init`

##Deploy the stack
`docker stack deploy -c jenkins-nginx.yml jenkins`
