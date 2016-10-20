#!/bin/bash


export CHROME_VERSION=$(CHROME -v | grep -Eo '\d+\.\d+(\.\d+)?')
sed -i "s|CHROME_VERSION|${CHROME_VERSION}|g" /opt/config.json
cd /opt && java -jar selenium-server-standalone.jar \
    -hub ${SELENIUM_HUB_URL} \
    -role node -nodeConfig  /opt/config.json



