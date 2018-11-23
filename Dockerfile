FROM  jenkinsci/jenkins:lts-alpine

MAINTAINER Raphael Theberge

# Pre-install plugins
COPY plugins.txt /tmp/plugins.txt
RUN /usr/local/bin/install-plugins.sh /tmp/plugins.txt
