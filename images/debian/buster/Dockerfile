FROM debian:buster-slim
MAINTAINER Dealerdirect <opensource@dealerdirect.nl>

ENV DEBIAN_FRONTEND noninteractive
ENV INSTALL_APT "initscripts libsystemd0 libudev1 systemd sysvinit-utils udev util-linux sudo git unzip ssh parallel rsync curl openssl ca-certificates apt-transport-https git-crypt"
ENV INSTALL_APT_BUILD_DEPS ""

ADD files/shared/ssh/* /root/.ssh/
ADD files/shared/scripts/*.sh /tmp/shared/scripts/
ADD files/debian/buster/sources.list /etc/apt/sources.list
ADD files/debian/buster/systemd.sh /tmp/
RUN mkdir -p /root/.parallel ; touch /root/.parallel/will-cite

RUN \
    bash /tmp/shared/scripts/install-upgrade-apt-packages.sh && \
    bash /tmp/systemd.sh && \
    bash /tmp/shared/scripts/cleanup.sh

VOLUME [ "/sys/fs/cgroup", "/run", "/run/lock" ]
CMD ["/lib/systemd/systemd"]
