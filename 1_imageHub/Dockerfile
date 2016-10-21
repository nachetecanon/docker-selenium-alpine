FROM selenium-alpine/base

MAINTAINER Nacho Cañón <nachete.canon@gmail.com>

RUN mkdir -p /var/log/supervisor

ADD supervisor/selenium-hub.sh ${SELENIUM_PATH}/
ADD supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN chmod +x ${SELENIUM_PATH}/selenium-hub.sh

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 4444
CMD ["/usr/bin/supervisord","-c", "/etc/supervisor/conf.d/supervisord.conf"]

