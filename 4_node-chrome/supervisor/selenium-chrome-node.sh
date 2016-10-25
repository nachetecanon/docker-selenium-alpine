#!/bin/bash


export CHROME_VERSION=$(chromium-browser  --product-version)
sed -i "s|CHROME_VERSION|${CHROME_VERSION}|g" /opt/selenium/config.json
xvfb-run -n 99 --server-args="-screen 0 $GEOMETRY -ac +extension RANDR" \
    java -jar /opt/selenium/selenium-server-standalone.jar  \
    -hub ${SELENIUM_HUB_URL} \
    -role node -nodeConfig  /opt/selenium/config.json



