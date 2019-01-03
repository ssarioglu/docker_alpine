FROM alpine:latest
MAINTAINER Serdar Sarioglu, Serdar.Sarioglu@mysystem.org

# Install Basic Tools
RUN apk update && apk upgrade
RUN apk add openssh busybox-extras wget curl bash lftp htop \
git docker python py-pip groff less mailcap bind-tools \
nmap nmap-scripts nmap-doc nmap-nping nmap-ncat zmap
RUN apk add hping3 mtr --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing

# Install PIP
RUN pip install --upgrade pip
RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make

# Install Azure CLI and AWS CLI
RUN pip install --upgrade awscli python-magic
RUN pip install azure-cli

RUN rm -rf /var/cache/apk/*

#Copy Scripts
COPY scripts /scripts
COPY modt /etc/motd
RUN chmod -R 777 /scripts

ENTRYPOINT ["/bin/bash"]
