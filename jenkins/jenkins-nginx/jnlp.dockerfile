from jenkins/jnlp-slave:alpine
MAINTAINER clemenko@docker.com
LABEL RUN="docker run -d -v /var/run/docker.sock:/var/run/docker.sock -v /jenkins/:/var/jenkins_home -v /jenkins/.ssh:/root/.ssh/ superjnlp -url http://jenkins-server:port -workDir=/home/jenkins/agent <secret> <agent name>"
USER root
RUN apk -U --no-cache add docker
