#!/usr/bin/env bash
set -o errexit  # Exit script when a command exits with non-zero status
set -o nounset  # Exit script on use of an undefined variable
set -o pipefail # Return exit status of the last command in the pipe that failed

apt-get -y remove --purge $INSTALL_APT_BUILD_DEPS
apt-get -y purge
apt-get -y autoremove
apt-get clean
rm -rf /tmp/*
rm -rf /root/.composer/cache
rm -rf /var/lib/apt/lists/*
rm -Rf /usr/share/doc
rm -Rf /usr/share/man
