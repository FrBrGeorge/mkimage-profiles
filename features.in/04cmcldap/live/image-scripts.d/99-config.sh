#!/bin/sh
umask 077
cat > /etc/nslcd.conf <<@@@
uid _nslcd
gid _nslcd
uri ldap://practicum.cs.msu.su
base dc=PRACTICUM,dc=CS,dc=MSU,dc=SU
binddn adread@practicum.cs.msu.su
bindpw wH=8L9k!4%Ry
tls_reqcert never
filter passwd (&(objectClass=user)(objectClass=person)(!(objectClass=computer)))
map    passwd uid           sAMAccountName
map    passwd homeDirectory "/home/\$sAMAccountName"
map    passwd gecos         displayName
map     passwd  gidNumber          "117"
map    passwd loginShell    "/bin/bash"
filter group (|(objectClass=group)(objectClass=person))
@@@
groupadd -g 117 netusers
