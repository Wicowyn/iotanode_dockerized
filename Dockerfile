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

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN export JAVA_HOME

EXPOSE 14600:14600/udp
EXPOSE 14265:14265
EXPOSE 15600:15600/tcp

RUN useradd -s /usr/sbin/nologin -m iota 

RUN sudo -u iota mkdir -p /home/iota/node /home/iota/node/ixi /home/iota/node/mainnetdb 
    
RUN sudo -u iota wget -O /home/iota/node/iri-1.4.2.1.jar https://github.com/iotaledger/iri/releases/download/v1.4.2.1/iri-1.4.2.1.jar

ADD src/iota.service /lib/systemd/system/iota.service

ADD src/iota.ini /home/iota/node/iota.ini

WORKDIR /home/iota

COPY src/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
