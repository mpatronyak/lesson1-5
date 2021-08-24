#!/bin/bash

systemctl enable firewalld
systemctl enable rpcbind
systemctl enable nfs-server
systemctl start firewalld
systemctl start rpcbind
systemctl start nfs-server


firewall-cmd --permanent --add-port=111/tcp
firewall-cmd --permanent --add-port=2049/udp
firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --permanent --zone=public --add-service=mountd 
firewall-cmd --reload 

mkdir /nfs-server
touch /nfs-server/upload
chmod 777 /nfs-server/upload
echo "/nfs-server 10.0.0.21 (rw,no_root_squash,no_all_squash)" > /etc/exports
exportfs -a
