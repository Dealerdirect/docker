#!/usr/bin/env bash
set -o errexit  # Exit script when a command exits with non-zero status
set -o pipefail # Return exit status of the last command in the pipe that failed

if [ ! -z "$INSTALL_PHP_EXT" ]; then
  for ext in $INSTALL_PHP_EXT; do
    if [[ "${ext}" = 'gd' ]] ; then
      docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
    fi
    docker-php-ext-install "$ext"
  done
fi

if [ ! -z "$INSTALL_PHP_PECL" ]; then
  for ext in $INSTALL_PHP_PECL; do
    pecl install "$ext"
    docker-php-ext-enable ${ext%%-*}
  done
fi
