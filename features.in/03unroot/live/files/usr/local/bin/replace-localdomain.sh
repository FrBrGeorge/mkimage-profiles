#!/bin/bash

IP=$(ip -o a show scope global | awk '{print $4}' | cut -d'/' -f1 | head -n1)
NEW_DOMAIN=$(dig -x "$IP" +short | sed 's/\.$//')

[ -z "$NEW_DOMAIN" ] && NEW_DOMAIN="localdomain"

sed -i "s/localdomain/$NEW_DOMAIN/g" /etc/hosts
