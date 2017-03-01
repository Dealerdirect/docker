#!/usr/bin/env bash
set -o errexit  # Exit script when a command exits with non-zero status
set -o nounset  # Exit script on use of an undefined variable
set -o pipefail # Return exit status of the last command in the pipe that failed

readonly GIT_CRYPT_VERSION=0.5.0-2

curl -L "https://github.com/AGWA/git-crypt/archive/debian/$GIT_CRYPT_VERSION.tar.gz" | tar zxv -C /var/tmp && \
cd "/var/tmp/git-crypt-debian-$GIT_CRYPT_VERSION"
make
make install PREFIX=/usr/local
cd -
rm -f -r /var/tmp/git-crypt-debian-$GIT_CRYPT_VERSION
