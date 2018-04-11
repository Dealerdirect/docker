FROM dealerdirect/debian:stretch
MAINTAINER Dealerdirect <opensource@dealerdirect.nl>

ENV INSTALL_APT "gnupg2 build-essential"
ENV NODE_VERSION "4.8.0"
ENV YARN_VERION "0.21.3"

ADD files/shared/scripts/*.sh /tmp/shared/scripts/

RUN \
    bash /tmp/shared/scripts/install-upgrade-apt-packages.sh && \
    bash /tmp/shared/scripts/install-nodejs.sh && \
    bash /tmp/shared/scripts/cleanup.sh
