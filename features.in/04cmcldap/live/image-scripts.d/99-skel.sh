#!/bin/sh
# XXX hack for re-creating /home/altlinux
DEFUSER="altlinux"
cp -a /etc/skel/.??* /home/$DEFUSER/
