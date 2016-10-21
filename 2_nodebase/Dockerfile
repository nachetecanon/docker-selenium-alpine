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

COPY xvfb.sh ${SELENIUM_PATH}
ENV DISPLAY ':0.0'

RUN chmod +x ${SELENIUM_PATH}/xvfb.sh

