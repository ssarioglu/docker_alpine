#A simple dockerfile for nmap
FROM alpine:latest
MAINTAINER Serdar.Sarioglu@mysystem.org

RUN apk update && apk add openssh curl bash python py-pip groff less mailcap bind-tools \
	pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic \
	&& rm -rf /var/cache/apk/*

