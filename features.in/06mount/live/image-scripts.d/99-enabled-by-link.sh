# systemd enable uuid-mount.service
ln -s /etc/systemd/system/uuid-mount.service /etc/systemd/system/multi-user.target.wants/uuid-mount.service
# ln -s /etc/systemd/system/net-home-mount.service /etc/systemd/system/multi-user.target.wants/net-home-mount.service
# ln -sf /etc/skel/.config/systemd/user/home-net-mount.service /etc/skel/.config/systemd/user/default.target.wants/home-net-mount.service
