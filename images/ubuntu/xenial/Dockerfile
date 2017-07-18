FROM ubuntu:xenial
MAINTAINER Dealerdirect <opensource@dealerdirect.nl>

ENV DEBIAN_FRONTEND noninteractive
ENV INSTALL_APT_BUILD_DEPS "build-essential libssl-dev"
ENV INSTALL_APT "sudo git unzip ssh parallel rsync gnupg-curl curl openssl ca-certificates apt-transport-https initscripts libsystemd0 libudev1 systemd sysvinit-utils udev util-linux"

ADD files/shared/ssh/* /root/.ssh/
ADD files/shared/scripts/*.sh /tmp/shared/scripts/
ADD files/ubuntu/xenial/sources.list /etc/apt/sources.list
ADD files/ubuntu/xenial/systemd.sh /tmp/

RUN \
    bash /tmp/shared/scripts/install-upgrade-apt-packages.sh && \
    bash /tmp/shared/scripts/install-git-crypt.sh && \
    bash /tmp/systemd.sh && \
    bash /tmp/shared/scripts/cleanup.sh

VOLUME [ "/sys/fs/cgroup", "/run", "/run/lock" ]
CMD ["/lib/systemd/systemd"]
