#!/bin/bash
# install systemd
yum install -y \
	iptables \
	iproute \
	kmod \
	procps-ng \
	sudo \
	udev
# unmask services
systemctl unmask \
	systemd-remount-fs.service \
	dev-hugepages.mount \
	sys-fs-fuse-connections.mount \
	systemd-logind.service \
	getty.target \
	console-getty.service
# prevents journald from reading kernel messages from /dev/kmsg
echo "ReadKMsg=no" >>/etc/systemd/journald.conf
# create default 'root/root' user
echo "root:root" | chpasswd
# install sshd
yum install -y openssh-server
mkdir -p /var/run/sshd
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config
ssh-keygen -A
# housekeeping
yum clean all
rm -rf \
	/var/cache/yum/* \
	/var/log/* \
	/tmp/* \
	/var/tmp/* \
	/usr/share/doc/* \
	/usr/share/man/*
