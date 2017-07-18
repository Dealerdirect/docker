#!/usr/bin/env bash
set -o errexit  # Exit script when a command exits with non-zero status
set -o nounset  # Exit script on use of an undefined variable
set -o pipefail # Return exit status of the last command in the pipe that failed

cd /lib/systemd/system/sysinit.target.wants/
ls | grep -v systemd-tmpfiles-setup.service | xargs rm -f
rm -f /lib/systemd/system/sockets.target.wants/*udev*
systemctl mask -- \
  tmp.mount \
  etc-hostname.mount \
  etc-hosts.mount \
  etc-resolv.conf.mount \
  -.mount \
  swap.target \
  getty.target \
  getty-static.service \
  dev-mqueue.mount \
  systemd-tmpfiles-setup-dev.service \
  systemd-tmpfiles-setup.service \
  systemd-remount-fs.service \
  systemd-update-utmp-runlevel.service \
  systemd-logind.service && \
  systemctl set-default multi-user.target || true
cd -
