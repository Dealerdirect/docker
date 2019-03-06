FROM dealerdirect/debian:stretch
MAINTAINER Dealerdirect <opensource@dealerdirect.nl>

ENV INSTALL_APT_BUILD_DEPS "python3-pip build-essential python3-dev libssl-dev libffi-dev python3-wheel"
ENV INSTALL_APT "python3 python3-six"
ENV ANSIBLE_VERSION "2.7.8"

ADD files/shared/scripts/*.sh /tmp/shared/scripts/
ADD files/ansible/scripts/*.sh /tmp/ansible/scripts/
ADD files/ansible/hosts /etc/ansible/hosts
ADD files/ansible/initctl_faker /tmp/

RUN \
    bash /tmp/shared/scripts/install-upgrade-apt-packages.sh && \
    bash /tmp/shared/scripts/install-pip.sh && \
    bash /tmp/ansible/scripts/install-ansible.sh && \
    bash /tmp/shared/scripts/cleanup.sh
