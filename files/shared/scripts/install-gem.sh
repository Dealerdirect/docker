#!/usr/bin/env bash
set -o errexit  # Exit script when a command exits with non-zero status
set -o pipefail # Return exit status of the last command in the pipe that failed

if [ ! -z "$INSTALL_GEM" ]; then
  gem install "$INSTALL_GEM"
fi
