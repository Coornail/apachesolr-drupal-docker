FROM dockerfile/java:openjdk-7-jdk

MAINTAINER  Kornel Lugosi "coornail@gmail.com"

EXPOSE 8983:8983

RUN apt-get update &&\
  apt-get -y upgrade &&\
  apt-get clean

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get -y install lsof curl procps

ENV SOLR_VERSION 4.10.2
ENV SOLR solr-$SOLR_VERSION

RUN mkdir -p /opt && \
  wget -nv --output-document=/opt/$SOLR.tgz http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/$SOLR_VERSION/$SOLR.tgz && \
  tar -C /opt --extract --file /opt/$SOLR.tgz && \
  rm /opt/$SOLR.tgz && \
  ln -s /opt/$SOLR /opt/solr

CMD ["/bin/bash", "-c", "/opt/solr/bin/solr -f"]
