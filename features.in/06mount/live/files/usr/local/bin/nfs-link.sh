#!/bin/bash
echo "$(date) — PAM_USER=$PAM_USER, PAM_TYPE=$PAM_TYPE" >> /var/log/netmount.log
if id -nG | grep -q netusers; then
	echo "$(date) — PAM_USER=$PAM_USER, in netusers" >> /var/log/netmount.log
	echo "$USER, $HOME" >> /var/log/netmount.log
        ln -s /mnt/nfs/$USER /$HOME/NET
	echo "$(date) — PAM_USER=$PAM_USER, linked NET success" >> /var/log/netmount.log
fi
echo "$(date) — PAM_USER=$PAM_USER, exited" >> /var/log/netmount.log
echo "" >> /var/log/netmount.log
exit 0
