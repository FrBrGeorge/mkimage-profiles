#!/bin/sh
sed -i "
/^passwd:/s/$/ ldap/
/^shadow:/s/$/ ldap/
/^group:/s/$/ ldap/
" /etc/nsswitch.conf
