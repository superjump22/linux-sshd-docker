#!/bin/bash
# install systemd
apt-get update
apt-get install -y --no-install-recommends \
	systemd \
	systemd-sysv \
	libsystemd0 \
	ca-certificates \
	dbus \
	iptables \
	iproute2 \
	kmod \
	locales \
	sudo \
	udev
# unmask services
systemctl mask systemd-udevd.service \
	systemd-udevd-kernel.socket \
	systemd-udevd-control.socket \
	systemd-modules-load.service \
	sys-kernel-debug.mount \
	sys-kernel-tracing.mount
# prevents journald from reading kernel messages from /dev/kmsg
echo "ReadKMsg=no" >>/etc/systemd/journald.conf
# create default 'root/root' user
echo "root:root" | chpasswd
# install sshd
apt-get update && apt-get install --no-install-recommends -y openssh-server
mkdir -p /var/run/sshd
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config
ssh-keygen -A
# change mirrors
cat <<EOF >/etc/apt/sources.list
deb http://mirrors.tencent.com/debian/ bookworm main contrib non-free non-free-firmware
# deb-src http://mirrors.tencent.com/debian/ bookworm main contrib non-free non-free-firmware
deb http://mirrors.tencent.com/debian/ bookworm-updates main contrib non-free non-free-firmware
# deb-src http://mirrors.tencent.com/debian/ bookworm-updates main contrib non-free non-free-firmware
deb http://mirrors.tencent.com/debian/ bookworm-backports main contrib non-free non-free-firmware
# deb-src http://mirrors.tencent.com/debian/ bookworm-backports main contrib non-free non-free-firmware
deb http://mirrors.tencent.com/debian-security bookworm-security main contrib non-free non-free-firmware
# deb-src http://mirrors.tencent.com/debian-security bookworm-security main contrib non-free non-free-firmware
EOF
apt-get clean -y
rm -rf \
	/var/cache/debconf/* \
	/var/lib/apt/lists/* \
	/var/log/* \
	/tmp/* \
	/var/tmp/* \
	/usr/share/doc/* \
	/usr/share/man/* \
	/usr/share/local/*
apt-get update && apt-get install --reinstall -y apt-transport-https ca-certificates
cat <<EOF >/etc/apt/sources.list
deb https://mirrors.tencentyun.com/debian/ bookworm main contrib non-free non-free-firmware
# deb-src https://mirrors.tencentyun.com/debian/ bookworm main contrib non-free non-free-firmware
deb https://mirrors.tencentyun.com/debian/ bookworm-updates main contrib non-free non-free-firmware
# deb-src https://mirrors.tencentyun.com/debian/ bookworm-updates main contrib non-free non-free-firmware
deb https://mirrors.tencentyun.com/debian/ bookworm-backports main contrib non-free non-free-firmware
# deb-src https://mirrors.tencentyun.com/debian/ bookworm-backports main contrib non-free non-free-firmware
deb https://mirrors.tencentyun.com/debian-security bookworm-security main contrib non-free non-free-firmware
# deb-src https://mirrors.tencentyun.com/debian-security bookworm-security main contrib non-free non-free-firmware
EOF
# housekeeping
apt-get clean -y
rm -rf \
	/var/cache/debconf/* \
	/var/lib/apt/lists/* \
	/var/log/* \
	/tmp/* \
	/var/tmp/* \
	/usr/share/doc/* \
	/usr/share/man/* \
	/usr/share/local/*