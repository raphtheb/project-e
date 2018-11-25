FROM  jenkinsci/jenkins:lts-alpine

MAINTAINER Raphael Theberge

# Since this is a test, we use dummy credentials.
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# And we disable the setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# We need to install docker in this container so it can spawn builds.
USER root
RUN apk add docker \
  && apk add --update shadow \
  && usermod -a -G root jenkins
USER jenkins

# Pre-install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Execute the groovy script to set credentials (defined above)
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# Also Pre-configure Jenkins
COPY jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml
