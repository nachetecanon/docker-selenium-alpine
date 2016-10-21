#!/bin/bash


export FIREFOX_VERSION=$(firefox -v | grep -Eo '\d+\.\d+(\.\d+)?')
sed -i "s|FIREFOX_VERSION|${FIREFOX_VERSION}|g" /opt/selenium/config.json
cd /opt/selenium && java -jar selenium-server-standalone.jar \
    -hub ${SELENIUM_HUB_URL} \
    -role node -nodeConfig  /opt/selenium/config.json



