FROM t0t0/docker-alpine-jre:8.77.03
MAINTAINER Tomas Vercautter & Toon Lamberigts

ENV ELASTICSEARCH_VERSION 2.3.2
ENV ELASTICSEARCH_IMAGE=elasticsearch-$ELASTICSEARCH_VERSION
ENV ELASTICSEARCH_IMAGE_TAR=$ELASTICSEARCH_IMAGE.tar.gz
ENV ELASTICSEARCH_DOWNLOAD_URL https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/$ELASTICSEARCH_VERSION/$ELASTICSEARCH_IMAGE_TAR

RUN apk --no-cache add --virtual .dependencies \
    wget \
    tar && \
    mkdir -p /opt && \
    wget $ELASTICSEARCH_DOWNLOAD_URL && \
    tar -xvf $ELASTICSEARCH_IMAGE_TAR -C /opt && \
    ln -s /opt/elasticsearch-$ELASTICSEARCH_VERSION /opt/elasticsearch && \
    rm -rf $ELASTICSEARCH_IMAGE_TAR /var/tmp/* /var/cache/apk/* && \
    apk del .dependencies && \
    mkdir /var/lib/elasticsearch && \
    chown nobody /var/lib/elasticsearch && \
    mkdir /opt/elasticsearch/plugins && \
    mkdir /opt/elasticsearch/config/scripts

# Add files
COPY config/elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml
COPY scripts/run.sh /scripts/run.sh

# Specify Volume
VOLUME ["/var/lib/elasticsearch"]

# Exposes	
EXPOSE 9200
EXPOSE 9300

USER nobody

# CMD
ENTRYPOINT ["/scripts/run.sh"]
