#!/bin/bash

cd /opt && java -jar selenium-server-standalone.jar -role node \
        -hub ${SELENIUM_HUB_URL} \
        -browser browserName=firefox,version=$FIREFOX_VERSION,maxInstances=1,platform=LINUX


