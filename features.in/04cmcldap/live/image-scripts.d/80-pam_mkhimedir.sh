#!/bin/sh
PAMF="/etc/pam.d/system-auth-common"
grep -q pam_mkhomedir.*"$DEFUSER" "$PAMF" || {
    echo "session   required    pam_mkhomedir.so skel=/home/$DEFUSER" >> "$PAMF"
}

