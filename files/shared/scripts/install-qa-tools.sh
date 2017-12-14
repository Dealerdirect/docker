#!/usr/bin/env bash
set -o errexit  # Exit script when a command exits with non-zero status
set -o pipefail # Return exit status of the last command in the pipe that failed

composer global require elfet/pure
curl -O https://raw.githubusercontent.com/DealerDirect/php-qa-tools/master/bin/install.sh
bash install.sh
rm -f install.sh
