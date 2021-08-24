#!/bin/bash

echo "Defaultvers=3" >> /etc/nfsmount.conf
echo "Defaultproto=udp" >> /etc/nfsmount.conf

mkdir /nfs
echo "10.0.0.10:/nfs-server /nfs nfs defaults 0 0" >> /etc/fstab


