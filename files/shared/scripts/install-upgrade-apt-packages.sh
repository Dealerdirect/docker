#!/usr/bin/env bash
set -o errexit  # Exit script when a command exits with non-zero status
set -o pipefail # Return exit status of the last command in the pipe that failed

apt-get -o Dpkg::Options::="--force-unsafe-io" -y update
apt-get -o Dpkg::Options::="--force-unsafe-io" -y dist-upgrade

source  /etc/os-release
APTEXTRA=''
if [ ${VERSION:3:-1} == 'jessie' ] ; then
  APTEXTRA=" -t jessie-backports "
fi
if [ ${VERSION:3:-1} == 'stretch' ] ; then
  APTEXTRA=" -t stretch-backports "
fi

if [ ! -z "$INSTALL_APT_BACKPORTS" ]; then
  apt-get -o Dpkg::Options::="--force-unsafe-io" -y ${APTEXTRA} install $INSTALL_APT_BACKPORTS
fi

if [ ! -z "$INSTALL_APT" ]; then
  apt-get -o Dpkg::Options::="--force-unsafe-io"  -y install --no-install-recommends $INSTALL_APT
fi

if [ ! -z "$INSTALL_APT_BUILD_DEPS" ]; then
  apt-get -o Dpkg::Options::="--force-unsafe-io"  -y install --no-install-recommends $INSTALL_APT_BUILD_DEPS
fi

