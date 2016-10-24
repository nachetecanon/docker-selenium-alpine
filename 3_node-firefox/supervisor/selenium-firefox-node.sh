#!/bin/bash


export FIREFOX_VERSION=$(firefox -v | grep -Eo '\d+\.\d+(\.\d+)?')
sed -i "s|FIREFOX_VERSION|${FIREFOX_VERSION}|g" /opt/selenium/config.json
xvfb-run -n 99 --server-args="-screen 0 1360x1020x24 -ac +extension RANDR" \
    java -jar /opt/selenium/selenium-server-standalone.jar  \
    -hub ${SELENIUM_HUB_URL} \
    -role node -nodeConfig  /opt/selenium/config.json



