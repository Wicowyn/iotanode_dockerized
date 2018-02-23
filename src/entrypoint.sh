#!/bin/bash
set -e

if [ ! "$(ls -A /home/iota/mainnetdb)"  ]; then
    echo "Downloading mainnet database..."

    curl -L http://db.iota.partners/IOTA.partners-mainnetdb.tar.gz -o /tmp/mainnetdb.tar.gz
    tar xzfv /tmp/mainnetdb.tar.gz -C /home/iota/mainnetdb
    rm /tmp/mainnetdb.tar.gz
fi

cd /home/iota

echo "NEIGHBORS=$NEIGHBORS" >> iota.ini

java -Xmx3000m -Djava.net.preferIPv4Stack=true -jar iri.jar -c iota.ini