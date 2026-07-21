#!/usr/bin/env bash

set -euo pipefail
systemctl disable ModemManager.service sshd.service thermald.service geoclue.service iio-sensor-proxy.service switcheroo-control.service bolt.service || true

rm -f /etc/gnome-initial-setup-done
rm -f /var/home/*/.config/gnome-initial-setup-done
