#!/bin/bash
apt-get update
apt-get install -y openssh-server
rm -rf /var/lib/apt/lists/*
mkdir -p /var/run/sshd
case "$DIST_VERSION" in
10)
	cat <<EOF >/etc/apt/sources.list
deb http://mirrors.tencent.com/debian/ bullseye main contrib non-free
# deb-src http://mirrors.tencent.com/debian/ bullseye main contrib non-free
deb http://mirrors.tencent.com/debian/ bullseye-updates main contrib non-free
# deb-src http://mirrors.tencent.com/debian/ bullseye-updates main contrib non-free
deb http://mirrors.tencent.com/debian/ bullseye-backports main contrib non-free
# deb-src http://mirrors.tencent.com/debian/ bullseye-backports main contrib non-free
deb http://mirrors.tencent.com/debian-security bullseye-security main contrib non-free
# deb-src http://mirrors.tencent.com/debian-security bullseye-security main contrib non-free
EOF
	;;
11)
	cat <<EOF >/etc/apt/sources.list
deb http://mirrors.tencent.com/debian/ bullseye main contrib non-free
# deb-src http://mirrors.tencent.com/debian/ bullseye main contrib non-free
deb http://mirrors.tencent.com/debian/ bullseye-updates main contrib non-free
# deb-src http://mirrors.tencent.com/debian/ bullseye-updates main contrib non-free
deb http://mirrors.tencent.com/debian/ bullseye-backports main contrib non-free
# deb-src http://mirrors.tencent.com/debian/ bullseye-backports main contrib non-free
deb http://mirrors.tencent.com/debian-security bullseye-security main contrib non-free
# deb-src http://mirrors.tencent.com/debian-security bullseye-security main contrib non-free
EOF
	;;
12)
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
	;;
*)
	echo "Unsupported version: $DIST_VERSION"
	exit 1
	;;
esac
apt-get update
apt-get install -y apt-transport-https ca-certificates
case "$DIST_VERSION" in
10)
	cat <<EOF >/etc/apt/sources.list
deb https://mirrors.tencentyun.com/debian/ bullseye main contrib non-free
# deb-src https://mirrors.tencentyun.com/debian/ bullseye main contrib non-free
deb https://mirrors.tencentyun.com/debian/ bullseye-updates main contrib non-free
# deb-src https://mirrors.tencentyun.com/debian/ bullseye-updates main contrib non-free
deb https://mirrors.tencentyun.com/debian/ bullseye-backports main contrib non-free
# deb-src https://mirrors.tencentyun.com/debian/ bullseye-backports main contrib non-free
deb https://mirrors.tencentyun.com/debian-security bullseye-security main contrib non-free
# deb-src https://mirrors.tencentyun.com/debian-security bullseye-security main contrib non-free
EOF
	;;
11)
	cat <<EOF >/etc/apt/sources.list
deb https://mirrors.tencentyun.com/debian/ bullseye main contrib non-free
# deb-src https://mirrors.tencentyun.com/debian/ bullseye main contrib non-free
deb https://mirrors.tencentyun.com/debian/ bullseye-updates main contrib non-free
# deb-src https://mirrors.tencentyun.com/debian/ bullseye-updates main contrib non-free
deb https://mirrors.tencentyun.com/debian/ bullseye-backports main contrib non-free
# deb-src https://mirrors.tencentyun.com/debian/ bullseye-backports main contrib non-free
deb https://mirrors.tencentyun.com/debian-security bullseye-security main contrib non-free
# deb-src https://mirrors.tencentyun.com/debian-security bullseye-security main contrib non-free
EOF
	;;
12)
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
	;;
*)
	echo "Unsupported version: $DIST_VERSION"
	exit 1
	;;
esac
