#!/usr/bin/env bash

set -euo pipefail


disable_services=(
    ModemManager.service
    thermald.service
    geoclue.service
    iio-sensor-proxy.service
    switcheroo-control.service
    bolt.service
)


for service in "${disable_services[@]}"; do
    systemctl disable "$service" 2>/dev/null || true
done


mask_services=(
    ModemManager.service
    bolt.service
)


for service in "${mask_services[@]}"; do
    systemctl mask "$service" 2>/dev/null || true
done
