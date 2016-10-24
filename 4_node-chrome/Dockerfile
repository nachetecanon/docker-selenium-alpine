FROM selenium-alpine/nodebase

MAINTAINER Nacho Cañón <nachete.canon@gmail.com>

RUN apk --no-cache add \
        chromium chromium-chromedriver
        
ADD supervisor/selenium-chrome-node.sh ${SELENIUM_PATH}/
ADD supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD chrome-launcher.sh /usr/bin/google-chrome
ADD config.json ${SELENIUM_PATH}/config.json


RUN chmod +x ${SELENIUM_PATH}/selenium-chrome-node.sh /usr/bin/google-chrome

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 4444

# Following line fixes
# https://github.com/SeleniumHQ/docker-selenium/issues/87
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

USER developer
WORKDIR /home/developer
CMD ["/usr/bin/supervisord","-c", "/etc/supervisor/conf.d/supervisord.conf"]

