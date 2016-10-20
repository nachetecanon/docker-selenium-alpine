FROM selenium-alpine/nodebase

MAINTAINER Nacho Cañón <icanon@paradigmatecnologico.com>

RUN apk --no-cache add \
        chromium
        
ADD supervisor/selenium-chrome-node.sh /root/
ADD supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf


ADD config.json /opt/config.json
ENV CHROME_DRIVER_VERSION=2.24

RUN cd /usr/bin &&  curl --progress-bar -k https://chromedriver.storage.googleapis.com/${CHROME_DRIVER_VERSION}/chromedriver_linux64.zip -o /usr/bin/chrome.zip \
    && unzip /usr/bin/chrome.zip

RUN chmod +x /usr/bin/chromedriver && \
    chmod +x /root/selenium-chrome-node.sh

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 4444

CMD ["/usr/bin/supervisord","-c", "/etc/supervisor/conf.d/supervisord.conf"]

