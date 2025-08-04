#!/bin/bash

IP=$(ip -o a show scope global | awk '{print $4}' | cut -d'/' -f1 | head -n1)
NEW_DOMAIN=$(dig -x "$IP" +short | sed 's/\.$//')

LAST_TWO_BYTES=$(echo "$IP" | awk -F '.' '{print "host-"$3 "-" $4}')
[ -z "$NEW_DOMAIN" ] && NEW_DOMAIN="$LAST_TWO_BYTES"

hostnamectl hostname $NEW_DOMAIN
exit 0
