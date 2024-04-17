#!/bin/bash
apt-get update
apt-get install -y openssh-server
rm -rf /var/lib/apt/lists/*
mkdir -p /var/run/sshd
case "$DIST_VERSION" in
20.04)
	cat <<EOF >/etc/apt/sources.list
deb https://mirrors.tencentyun.com/ubuntu/ focal main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ focal main restricted universe multiverse
deb https://mirrors.tencentyun.com/ubuntu/ focal-updates main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb https://mirrors.tencentyun.com/ubuntu/ focal-backports main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb https://mirrors.tencentyun.com/ubuntu/ focal-security main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ focal-security main restricted universe multiverse
# deb https://mirrors.tencentyun.com/ubuntu/ focal-proposed main restricted universe multiverse
# # deb-src https://mirrors.tencentyun.com/ubuntu/ focal-proposed main restricted universe multiverse
EOF
	;;
22.04)
	cat <<EOF >/etc/apt/sources.list
deb https://mirrors.tencentyun.com/ubuntu/ jammy main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ jammy main restricted universe multiverse
deb https://mirrors.tencentyun.com/ubuntu/ jammy-updates main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ jammy-updates main restricted universe multiverse
deb https://mirrors.tencentyun.com/ubuntu/ jammy-backports main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ jammy-backports main restricted universe multiverse
deb https://mirrors.tencentyun.com/ubuntu/ jammy-security main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ jammy-security main restricted universe multiverse
# deb https://mirrors.tencentyun.com/ubuntu/ jammy-proposed main restricted universe multiverse
# # deb-src https://mirrors.tencentyun.com/ubuntu/ jammy-proposed main restricted universe multiverse
EOF
	;;
23.10)
	cat <<EOF >/etc/apt/sources.list
deb https://mirrors.tencentyun.com/ubuntu/ mantic main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ mantic main restricted universe multiverse
deb https://mirrors.tencentyun.com/ubuntu/ mantic-updates main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ mantic-updates main restricted universe multiverse
deb https://mirrors.tencentyun.com/ubuntu/ mantic-backports main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ mantic-backports main restricted universe multiverse
deb https://mirrors.tencentyun.com/ubuntu/ mantic-security main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ mantic-security main restricted universe multiverse
# deb https://mirrors.tencentyun.com/ubuntu/ mantic-proposed main restricted universe multiverse
# # deb-src https://mirrors.tencentyun.com/ubuntu/ mantic-proposed main restricted universe multiverse
EOF
	;;
24.04)
	cat <<EOF >/etc/apt/sources.list
deb https://mirrors.tencentyun.com/ubuntu/ noble main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ noble main restricted universe multiverse
deb https://mirrors.tencentyun.com/ubuntu/ noble-updates main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ noble-updates main restricted universe multiverse
deb https://mirrors.tencentyun.com/ubuntu/ noble-backports main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ noble-backports main restricted universe multiverse
deb https://mirrors.tencentyun.com/ubuntu/ noble-security main restricted universe multiverse
# deb-src https://mirrors.tencentyun.com/ubuntu/ noble-security main restricted universe multiverse
# deb https://mirrors.tencentyun.com/ubuntu/ noble-proposed main restricted universe multiverse
# # deb-src https://mirrors.tencentyun.com/ubuntu/ noble-proposed main restricted universe multiverse
EOF
	;;
*)
	echo "Unsupported version: $DIST_VERSION"
	exit 1
	;;
esac
