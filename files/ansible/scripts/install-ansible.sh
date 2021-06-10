#!/usr/bin/env bash
set -o errexit  # Exit script when a command exits with non-zero status
set -o pipefail # Return exit status of the last command in the pipe that failed

pip=$(which pip) || pip=$(which pip3)

$pip install --prefer-binary --upgrade setuptools
$pip install --prefer-binary cryptography boto passlib dnspython

if [ ! -z "$ANSIBLE_VERSION" ]; then
  $pip install --prefer-binary "ansible==$ANSIBLE_VERSION" ansible-lint
else
  $pip install --prefer-binary ansible ansible-lint
fi

rm -fr /sbin/initctl
mv /tmp/initctl_faker /sbin/initctl
chmod +x /sbin/initctl
