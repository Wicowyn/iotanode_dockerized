#!/bin/bash
set -e

if [ -d /home/iota/node/mainnetdb ]; then
    curl -L http://db.iota.partners/IOTA.partners-mainnetdb.tar.gz -o /tmp/mainnetdb.tar.gz
    tar xzfv /tmp/mainnetdb.tar.gz -C /home/iota/node/mainnetdb
    rm /tmp/mainnetdb.tar.gz
fi

cd /home/iota/node

java -Xmx3000m -Djava.net.preferIPv4Stack=true -jar iri-1.4.2.1.jar -c iota.ini