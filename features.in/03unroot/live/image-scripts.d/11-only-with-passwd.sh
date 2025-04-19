sed -i 's/NOPASSWD: ALL/PASSWD: ALL/g' /etc/sudoers
find /etc/sudoers.d/ -type f -exec sed -i 's/NOPASSWD: ALL/PASSWD: ALL/g' {} \;
