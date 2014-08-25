#!/bin/bash
# Thiet lap cho ubuntu 

echo "#### Sao luu file cau hinh #####"
filessh=/etc/ssh/sshd_config
test -f $filessh.bka || cp $filessh $filessh.bka

echo "##### Cau hinh cho ssh #####"
read -p"Nhap port can thay doi:" portssh
sed -i "s/Port */Port $portssh/g" $filessh
sed -e "s/PermitRootLogin yes/PermitRootLogin without-password/g" /etc/ssh/sshd_config

echo "##### Cai dat TCPD #####"
sudo apt-get install tcpd
echo "##### Sao luu cac file cua TCPD #####"
filehostdeny=/etc/hosts.deny
filehostallow=/etc/hosts.allow
test -f $filehostdeny.bka || cp $filehostdeny $filehostdeny.bka
test -f $filehostallow.bka || cp $filehostallow $filehostallow.bka

sleep 5
echo "###### Cau hinh TCPD ######"
read -p"Nhap host duoc phep SSH" allowssh
echo "sshd: $allowssh" >> $filehostallow

echo "ALL: ALL" >> $filehostdeny