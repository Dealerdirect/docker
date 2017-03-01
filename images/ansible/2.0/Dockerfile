FROM dealerdirect/debian:jessie
MAINTAINER Dealerdirect <opensource@dealerdirect.nl>

ENV INSTALL_APT_BUILD_DEPS "python-pip build-essential python-dev libssl-dev libffi-dev"
ENV INSTALL_PIP "ansible-lint"
ENV INSTALL_APT "python python-six"
ENV ANSIBLE_VERSION "2.0.2.0"

ADD files/shared/scripts/*.sh /tmp/shared/scripts/
ADD files/ansible/scripts/*.sh /tmp/ansible/scripts/
ADD files/ansible/initctl_faker /tmp/

RUN \
    bash /tmp/shared/scripts/install-upgrade-apt-packages.sh && \
    bash /tmp/shared/scripts/install-pip.sh && \
    bash /tmp/ansible/scripts/install-ansible.sh && \
    bash /tmp/shared/scripts/cleanup.sh
