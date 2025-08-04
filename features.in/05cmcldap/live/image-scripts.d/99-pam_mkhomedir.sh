#!/bin/sh
PAMF="/etc/pam.d/su"
echo "session   required    pam_mkhomedir.so" >> "$PAMF"
