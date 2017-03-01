#!/usr/bin/env bash
set -o errexit  # Exit script when a command exits with non-zero status
set -o pipefail # Return exit status of the last command in the pipe that failed

apt-get -y update
apt-get -y upgrade

if [ ! -z "$INSTALL_APT_BACKPORTS" ]; then
  apt-get -y -t jessie-backports install $INSTALL_APT_BACKPORTS
fi

if [ ! -z "$INSTALL_APT_BUILD_DEPS" ]; then
  apt-get -y install --no-install-recommends $INSTALL_APT_BUILD_DEPS
fi

if [ ! -z "$INSTALL_APT" ]; then
  apt-get -y install --no-install-recommends $INSTALL_APT
fi
