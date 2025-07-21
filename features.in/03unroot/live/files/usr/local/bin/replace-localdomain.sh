#!/bin/bash

IP=$(hostname -I | awk '{print $1}')
NEW_DOMAIN=$(dig -x "$IP" +short | sed 's/\.$//')

[ -z "$NEW_DOMAIN" ] && NEW_DOMAIN="localdomain"

sed -i "s/localdomain/$NEW_DOMAIN/g" /etc/hosts
