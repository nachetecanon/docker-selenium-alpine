FROM alpine

MAINTAINER Nacho Cañón <nachete.canon@gmail.com>

# Install cURL, tar, etc
RUN apk --update add bash curl supervisor

# set C.UTF-8 locale as default.

ENV LANG=C.UTF-8 \
    LC_MONETARY=C.UTF-8 \
    LC_PAPER=C.UTF-8 \
    LC_NAME=C.UTF-8 \
    LC_ADDRESS=C.UTF-8 \
    LC_TELEPHONE=C.UTF-8 \
    LC_MEASUREMENT=C.UTF-8 \
    LC_IDENTIFICATION=C.UTF-8

#==============================
# download openjdk
#==============================
# add a simple script that can auto-detect the appropriate JAVA_HOME value
# based on whether the JDK or only the JRE is installed
RUN { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home \
	&& chmod +x /usr/local/bin/docker-java-home
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

ENV JAVA_VERSION 8u92
ENV JAVA_ALPINE_VERSION 8.92.14-r1

RUN set -x \
	&& apk add --no-cache \
		openjdk8="$JAVA_ALPINE_VERSION" \
	&& [ "$JAVA_HOME" = "$(docker-java-home)" ]

ENV PATH ${PATH}:${JAVA_HOME}/bin

#==============================
# download Selenium server
#==============================
ENV SELENIUM_STANDALONE_VERSION 3.0.1
ENV SELENIUM_STANDALONE_BASE 3.0

ADD https://selenium-release.storage.googleapis.com/${SELENIUM_STANDALONE_BASE}/selenium-server-standalone-${SELENIUM_STANDALONE_VERSION}.jar /opt/

ENV SELENIUM_PATH /opt

RUN mv /opt/selenium-server-standalone-${SELENIUM_STANDALONE_VERSION}.jar /opt/selenium-server-standalone.jar \
    && chmod 755 /opt/selenium-server-standalone.jar

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && export SELELENIUM_PATH=/opt

