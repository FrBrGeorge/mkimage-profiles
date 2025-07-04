#!/bin/sh
ENABLE="nscd nslcd nfs-client.target home-export.mount prometheus-node_exporter.socket node_exporter-smart.timer" 
    
mkdir -p /home/export
cat > /etc/systemd/system/home-export.mount <<@@@
[Unit]
Description=Users homes
After=rpc-statd.service

[Mount]
What=192.168.62.12:/jails/samba4/home/export
Where=/home/export
Type=nfs
Options=_netdev,auto

[Install]
WantedBy=multi-user.target
@@@

for S in $ENABLE; do
    systemctl enable --quiet --now $S
done

systemctl restart lightdm
