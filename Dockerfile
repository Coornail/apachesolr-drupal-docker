FROM java:openjdk-7-jdk

MAINTAINER  Kornel Lugosi "coornail@gmail.com"

EXPOSE 8983:8983

RUN apt-get update &&\
  apt-get -y upgrade &&\
  apt-get clean

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get -y install lsof curl procps

ENV SOLR_VERSION 4.10.4
ENV SOLR solr-$SOLR_VERSION

# Download Solr.
RUN mkdir -p /opt && \
  wget -nv --output-document=/opt/$SOLR.tgz https://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz && \
  tar -C /opt --extract --file /opt/$SOLR.tgz && \
  rm /opt/$SOLR.tgz && \
  ln -s /opt/$SOLR /opt/solr

# Add Drupal schema files.
RUN wget -nv http://ftp.drupal.org/files/projects/apachesolr-7.x-1.7.tar.gz && \
  tar -xvzf  apachesolr-7.x-* && \
  cp apachesolr/solr-conf/solr-4.x/* /opt/solr/example/solr/collection1/conf && \
  rm -rf ./apachesolr-*

CMD ["/bin/bash", "-c", "/opt/solr/bin/solr -f"]
