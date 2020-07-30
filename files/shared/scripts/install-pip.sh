#!/usr/bin/env bash
set -o errexit  # Exit script when a command exits with non-zero status
set -o pipefail # Return exit status of the last command in the pipe that failed

pip=$(which pip3) || pip=$(which pip)

$pip install --upgrade setuptools

if [ ! -z "$INSTALL_PIP" ]; then
  $pip install $INSTALL_PIP
fi
