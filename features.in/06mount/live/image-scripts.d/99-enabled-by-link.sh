# systemd enable uuid-mount.service
ln -s /etc/systemd/system/uuid-mount.service /etc/systemd/system/multi-user.target.wants/uuid-mount.service
# ln -s /etc/systemd/system/net-home-mount.service /etc/systemd/system/multi-user.target.wants/net-home-mount.service
# ln -s /etc/skel/.config/systemd/user/nfs-link.service /etc/skel/.config/systemd/user/default.target.wants/nfs-link.service
