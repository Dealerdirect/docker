#!/usr/bin/env bash
set -o errexit  # Exit script when a command exits with non-zero status
set -o pipefail # Return exit status of the last command in the pipe that failed

pip install --upgrade setuptools
pip install cryptography boto passlib dnspython

if [ ! -z "$ANSIBLE_VERSION" ]; then
  pip install "ansible==$ANSIBLE_VERSION"
else
  pip install ansible
fi

mkdir -p /etc/ansible
echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

rm -fr /sbin/initctl
mv /tmp/initctl_faker /sbin/initctl
chmod +x /sbin/initctl
