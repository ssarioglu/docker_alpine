FROM alpine:latest
MAINTAINER Serdar.Sarioglu@mysystem.org

# Install Basic Tools
RUN apk update
RUN apk add openssh busybox-extras wget curl bash \
python py-pip groff less mailcap bind-tools \
nmap nmap-scripts nmap-doc nmap-nping nmap-ncat zmap

# Install PIP
RUN pip install --upgrade pip
RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make

# Install Azure CLI and AWS CLI
RUN pip install --upgrade awscli python-magic
RUN pip install azure-cli

RUN rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/bash"]
