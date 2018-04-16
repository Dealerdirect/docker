FROM dealerdirect/debian:stretch
MAINTAINER Dealerdirect <opensource@dealerdirect.nl>

ENV INSTALL_APT "dirmngr gnupg2 build-essential"
ENV NODE_VERSION "7.7.0"

ADD files/shared/scripts/*.sh /tmp/shared/scripts/

RUN \
    bash /tmp/shared/scripts/install-upgrade-apt-packages.sh && \
    bash /tmp/shared/scripts/install-nodejs.sh && \
    bash /tmp/shared/scripts/cleanup.sh
