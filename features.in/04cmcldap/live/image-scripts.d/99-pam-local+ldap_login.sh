sed -i 's/^account sufficient pam_unix.so//' /etc/pam.d/system-auth-common
echo """
auth sufficient pam_ldap.so use_first_pass
auth required pam_deny.so
""" >> /etc/pam.d/system-auth-common
