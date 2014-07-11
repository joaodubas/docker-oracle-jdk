# oracle jdk
#
# VERSION: see `TAG`
FROM ubuntu:14.04
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install system deps
RUN sed -i 's/main$/main universe/' /etc/apt/sources.list \
    && apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install software-properties-common

# install oracle jdk
ENV JDK_INST oracle-java7-installer
ENV JDK_LIC shared/accepted-oracle-license-v1-1
ENV JDK ${JDK_INST} ${JDK_LIC} select true
RUN add-apt-repository -y ppa:webupd8team/java \
    && echo ${JDK} | /usr/bin/debconf-set-selections \
    && apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install oracle-java7-installer

# cleanup unused files
RUN apt-get -y -qq --force-yes clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# system environment variables
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
