FROM selenium-alpine/nodebase

MAINTAINER Nacho Cañón <nachete.canon@gmail.com>

RUN apk --no-cache add \
        firefox-esr
        
ADD supervisor/selenium-firefox-node.sh ${SELENIUM_PATH}/
ADD supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD geckodriver /usr/bin/geckodriver
ADD config.json ${SELENIUM_PATH}/config.json

RUN chmod +x /usr/bin/geckodriver && \
    chmod +x ${SELENIUM_PATH}/selenium-firefox-node.sh

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 4444


CMD ["/usr/bin/supervisord","-c", "/etc/supervisor/conf.d/supervisord.conf"]

