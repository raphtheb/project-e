FROM  jenkinsci/jenkins:lts-alpine

MAINTAINER Raphael Theberge

# Pre-install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# Also Pre-configure Jenkins
COPY jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
