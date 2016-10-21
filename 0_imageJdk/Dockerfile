FROM alpine

MAINTAINER Nacho Cañón <icanon@paradigmatecnologico.com>

# Install cURL, tar, etc
RUN apk --update add bash curl supervisor
# Here we install GNU libc (aka glibc) and set C.UTF-8 locale as default.

ENV LANG=C.UTF-8 \
    LC_MONETARY=C.UTF-8 \
    LC_PAPER=C.UTF-8 \
    LC_NAME=C.UTF-8 \
    LC_ADDRESS=C.UTF-8 \
    LC_TELEPHONE=C.UTF-8 \
    LC_MEASUREMENT=C.UTF-8 \
    LC_IDENTIFICATION=C.UTF-8

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

ADD selenium/selenium-server-standalone.jar /opt/

ENV SELENIUM_PATH /opt

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && export SELELENIUM_PATH=/opt

