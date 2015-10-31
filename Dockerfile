# VERSION   1.0.0

FROM ubuntu:15.04
MAINTAINER Erol <erol@erol.si>

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes software-properties-common python-software-properties
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get -y update
RUN /bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install oracle-java8-installer oracle-java8-set-default

# KairosDB
RUN wget https://github.com/kairosdb/kairosdb/releases/download/v1.0.0/kairosdb_1.0.0-1_all.deb
RUN dpkg -i kairosdb_1.0.0-1_all.deb
RUN rm kairosdb_1.0.0-1_all.deb

ADD conf/kairosdb.properties /opt/kairosdb/conf/kairosdb.properties

EXPOSE 4242 8080
