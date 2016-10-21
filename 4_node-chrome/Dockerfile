FROM selenium-alpine/nodebase

MAINTAINER Nacho Cañón <icanon@paradigmatecnologico.com>

RUN apk --no-cache add \
        chromium chromium-chromedriver
        
ADD supervisor/selenium-chrome-node.sh /root/
ADD supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD config.json /opt/config.json


RUN chmod +x /root/selenium-chrome-node.sh

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 4444

CMD ["/usr/bin/supervisord","-c", "/etc/supervisor/conf.d/supervisord.conf"]

