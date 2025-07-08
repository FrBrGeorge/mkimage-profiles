#!/bin/bash

# Парсим /proc/cmdline и извлекаем mount=UUID:subdir
PUBLIC_MOUNT=$(grep -oP 'mount=\K[^ ]+' /proc/cmdline || echo "")

# Если параметр не передан, используем значения по умолчанию
if [ -n "$PUBLIC_MOUNT" ]; then
    IFS=';' read -r -a pairs <<< "$PUBLIC_MOUNT"
    echo "$pairs"
    for pair in ${pairs[@]}; do
        IFS=':' read -r UUID SUBDIR <<< "$pair"
        echo "$UUID $SUBDIR"
        if [ -z "$UUID" ]; then
                echo "Error: UUID not specified!" >&2
        else
                MOUNT_POINT="/mnt$SUBDIR"
                mkdir -p "/mnt$SUBDIR"
                mount "$UUID:$SUBDIR" "$MOUNT_POINT"
                mount "$UUID:$SUBDIR=первое" "$MOUNT_POINT=второе"
		первое:второе
        fi
    done
fi
