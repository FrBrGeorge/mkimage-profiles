#!/bin/sh
# rm -f /etc/lightdm/lightdm.conf.d/autologin.conf
#sed -i 's/^autologin-user=.*/autologin-user=/' /etc/lightdm/lightdm.conf
#echo '[SeatDefaults]' >> /etc/lightdm/lightdm.conf
#echo 'autologin-user=' >> /etc/lightdm/lightdm.conf
echo '' > /etc/lightdm/lightdm.conf.d/autologin.conf
sed -i 's/^.*pam_autologin.so.*//' /etc/pam.d/*
#sed -i 's/^.*pam_permit.so.*//' /etc/pam.d/*
sed -i 's/^.*pam_trust.so.*//' /etc/pam.d/*
gpasswd -d altlinux nopasswdlogin
