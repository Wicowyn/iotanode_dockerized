FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils \
    && apt-get update \
    && apt-get install sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt update -qqy --fix-missing \
    && apt-get upgrade -y \
    && apt-get clean -y \
    && apt-get autoremove -y --purge 

RUN apt install software-properties-common -y \
    && add-apt-repository ppa:webupd8team/java -y \
    && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
    && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
    && apt update \
    && apt install oracle-java8-installer curl wget jq git -y \
    && apt install oracle-java8-set-default -y 

ARG iota_version
ENV IOTA_VERSION=${iota_version:-1.4.2.1}

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle

EXPOSE 14600:14600/udp
EXPOSE 14265:14265
EXPOSE 15600:15600/tcp

RUN mkdir -p /home/iota /home/iota/ixi /home/iota/mainnetdb 
    
RUN wget --quiet -O /home/iota/iri.jar https://github.com/iotaledger/iri/releases/download/v${IOTA_VERSION}/iri-${IOTA_VERSION}.jar

COPY src/iota.service /lib/systemd/system/iota.service
COPY src/iota.ini /home/iota/iota.ini

WORKDIR /home/iota
VOLUME /home/iota/mainnetdb

COPY src/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
