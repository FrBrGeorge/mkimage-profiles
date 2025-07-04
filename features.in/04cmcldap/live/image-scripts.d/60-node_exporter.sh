#!/bin/sh
NAME=node_exporter
TEXTFILES="/var/lib/prometheus/node-exporter"
EXPORTERS="smart"
cat > /etc/sysconfig/prometheus-node_exporter <<@@@
OPTIONS=" \
 --collector.diskstats.ignored-devices=^(ram|loop|fd|(h|s|v|xv)d[a-z]|nvmed+nd+p)d+\$ \
 --collector.filesystem.ignored-mount-points=^/(sys|proc|dev|run|media|(opt|var/lib|mnt/space)/(docker|lxcfs))(\$|/) \
 --collector.filesystem.ignored-fs-types=^(overlay|squashfs)\$ \
 --collector.netclass.ignored-devices=^lo\$ \
 --collector.textfile.directory=$TEXTFILES"
@@@

N=1
for EXP in $EXPORTERS; do
        install $0.$EXP /usr/libexec/$NAME-$EXP.sh

        cat > /etc/systemd/system/$NAME-$EXP.service <<@@@
[Unit]
Description=Prometheus expoter for $EXP
        
[Service]
Type=oneshot
ExecStart=/usr/libexec/$NAME-$EXP.sh
StandardOutput=truncate:$TEXTFILES/$EXP.prom
@@@

        cat > /etc/systemd/system/$NAME-$EXP.timer <<@@@
[Unit]
Description=Prometheus expoter for $EXP

[Timer]
OnBootSec=1min
OnCalendar=*:$N/5
Unit=$NAME-$EXP.service

[Install]
WantedBy=multi-user.target
@@@
        N=$(((N+1)%60))
done

