FROM alpine
LABEL maintainer="clemenko@docker.com", \
      python="3", \
      org.label-schema.vcs-url="https://github.com/clemenko/dc18_supply_chain", \
      org.label-schema.docker.cmd="docker run -d -p 5000:5000 clemenko/dc18", \
      org.label-schema.description="This is a simple Flask app for the Secure, Automated Software Supply Chain - Dockercon 2018 workshop"
RUN apk -U upgrade && apk add --no-cache curl py3-pip  &&\
    pip3 install --no-cache-dir --upgrade pip &&\
    pip3 install --no-cache-dir flask &&\
    rm -rf /var/cache/apk/*
WORKDIR /code
ADD . /code
EXPOSE 5000
HEALTHCHECK CMD curl -f http://localhost:5000/ || exit 1
CMD ["python3", "app.py"]
