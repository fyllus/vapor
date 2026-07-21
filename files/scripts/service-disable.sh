#!/usr/bin/env bash

set -euo pipefail

systemctl disable ModemManager.service || true
systemctl disable sshd.service || true
systemctl disable thermald.service || true
systemctl disable geoclue.service || true
systemctl disable iio-sensor-proxy.service || true
systemctl disable switcheroo-control.service || true
systemctl disable bolt.service || true

rm -f /etc/gnome-initial-setup-done
rm -f /var/home/*/.config/gnome-initial-setup-done
