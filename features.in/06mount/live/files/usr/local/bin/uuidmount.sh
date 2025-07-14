#!/bin/bash

# Парсим /proc/cmdline и извлекаем mount=DEVICE1^MOUNT_POINT1;DEVICE2^MOUNT_POINT2
# где два уровня разделителей ; между парами, ^ между устройством и точкой монтирования
PUBLIC_MOUNT=$(grep -oP 'mount=\K[^ ]+' /proc/cmdline || echo "")

if [ -n "$PUBLIC_MOUNT" ]; then
    IFS=';' read -r -a pairs <<< "$PUBLIC_MOUNT"
    for pair in ${pairs[@]}; do
        IFS='^' read -r DEVICE MOUNT_POINT <<< "$pair"
        if [ -z "$DEVICE" ]; then
                echo "Error: DEVICE not specified!" >&2
        else
                mkdir -p "$MOUNT_POINT"
                mount "$DEVICE" "$MOUNT_POINT"
        fi
    done
fi
exit 0
