#!/bin/sh
echo '' > /etc/lightdm/lightdm.conf.d/autologin.conf
sed -i 's/^.*pam_autologin.so.*//' /etc/pam.d/*
sed -i 's/^.*pam_trust.so.*//' /etc/pam.d/*
gpasswd -d altlinux nopasswdlogin
