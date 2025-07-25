#!/bin/bash
if id -nG | grep -q netusers; then
        ln -s /mnt/nfs/$USER /$HOME/NET
fi
exit 0
