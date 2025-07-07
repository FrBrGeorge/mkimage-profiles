echo """
auth sufficient pam_unix.so try_first_pass nullok
account sufficient pam_unix.so
""" >> /etc/pam.d/system-auth-common
