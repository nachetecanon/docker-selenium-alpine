FROM selenium-alpine/base

MAINTAINER Nacho Cañón <nachete.canon@gmail.com>

ENV SELENIUM_HUB_URL http://hub:4444/grid/register

RUN apk --no-cache add \
        dbus \
        ttf-freefont \
        xvfb \
    && \
    # Fix for D-Bus issue:
    # D-Bus library appears to be incorrectly set up; failed to read machine uuid: Failed to open "/etc/machine-id": No such file or directory
    dbus-uuidgen --ensure=/etc/machine-id

COPY xvfb-run /usr/bin
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
ENV SCREEN_WIDTH 1360
ENV SCREEN_HEIGHT 1020
ENV SCREEN_DEPTH 24
ENV DISPLAY :99.0
ENV GEOMETRY "$SCREEN_WIDTH""x""$SCREEN_HEIGHT""x""$SCREEN_DEPTH"
RUN chmod +x /usr/bin/xvfb-run

