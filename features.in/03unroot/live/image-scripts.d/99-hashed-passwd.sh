#!/bin/bash
PASS=$(openssl passwd -1 -salt "randomprac" "prac")
usermod -p "$PASS" root
PASS=$(openssl passwd -1 -salt "randomguest" "guest")
usermod -p "$PASS" altlinux
