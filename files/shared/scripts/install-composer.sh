#!/usr/bin/env bash
set -o errexit  # Exit script when a command exits with non-zero status
set -o pipefail # Return exit status of the last command in the pipe that failed

curl -sS https://getcomposer.org/installer | php -- --2
mv composer.phar /usr/local/bin/
ln -s /usr/local/bin/composer.phar /usr/local/bin/composer
