#!/bin/sh
umask 077
cat > /etc/nslcd.conf <<@@@
uid _nslcd
gid _nslcd
uri XXX
base dc=XXX
binddn XXX
bindpw XXX
tls_reqcert XXX
filter passwd (&(objectClass=user)(objectClass=person)(!(objectClass=computer)))
map    passwd uid           XXX
map    passwd homeDirectory XXX
map    passwd gecos         XXX
map     passwd  gidNumber          "117"
map    passwd loginShell    "/bin/bash"
filter group (|(objectClass=group)(objectClass=person))
@@@
groupadd -g 117 netusers
