FROM alpine:latest
MAINTAINER Serdar.Sarioglu@mysystem.org

# Install Requirements for Azure CLI and AWS CLI
RUN apk update && apk add openssh busybox-extras curl bash python py-pip groff less mailcap bind-tools nmap
RUN pip install --upgrade pip
RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make

# Install Azure CLI and AWS CLI
RUN pip install --upgrade awscli python-magic
RUN pip install azure-cli

RUN rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/bash"]
