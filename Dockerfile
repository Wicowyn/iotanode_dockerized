FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends openjdk-9-jre curl \
    && rm -rf /var/lib/apt/lists/*

ARG iota_version
ENV IOTA_VERSION=${iota_version:-1.4.2.1}

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle

EXPOSE 14600/udp
EXPOSE 14265
EXPOSE 15600/tcp

RUN mkdir -p /home/iota /home/iota/ixi /home/iota/mainnetdb 
    
RUN curl -L https://github.com/iotaledger/iri/releases/download/v${IOTA_VERSION}/iri-${IOTA_VERSION}.jar -o /home/iota/iri.jar

COPY src/iota.ini /home/iota/iota.ini

WORKDIR /home/iota
VOLUME /home/iota/mainnetdb

COPY src/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
