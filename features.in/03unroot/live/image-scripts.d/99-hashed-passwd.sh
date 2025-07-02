#!/bin/bash
PASS=$(openssl passwd -1 -salt "randomprac" "root")
usermod -p "$PASS" root
PASS=$(openssl passwd -1 -salt "randomguest" "altlinux")
usermod -p "$PASS" altlinux
