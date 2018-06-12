FROM alpine as build
RUN apk -U add docker

FROM jenkins/jenkins:lts-alpine
LABEL maintainer="clemenko@docker.com", \
      org.label-schema.vcs-url="https://github.com/clemenko/dockerfiles/tree/master/demo_flask", \
      org.label-schema.docker.cmd="docker run -d -v /var/run/docker.sock:/var/run/docker.sock -v /jenkins/:/var/jenkins_home -v /jenkins/.ssh:/root/.ssh/ -p 8080:8080 -p 50000:50000 --name jenkins superjenkins"
USER root
RUN apk -U add libltdl && rm -rf /var/cache/apk/*
COPY --from=build /usr/bin/docker /usr/bin/
