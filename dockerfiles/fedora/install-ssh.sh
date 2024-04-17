#!/bin/bash
dnf update -y
dnf install -y openssh-server
rm -rf /var/cache/dnf/*
mkdir -p /var/run/sshd
case "$DIST_VERSION" in
38)
	sed -e 's|^metalink=|#metalink=|g' \
		-e 's|^#baseurl=http://download.example/pub/fedora/linux|baseurl=https://mirrors.tencentyun.com/fedora|g' \
		-i.bak \
		/etc/yum.repos.d/fedora.repo \
		/etc/yum.repos.d/fedora-modular.repo \
		/etc/yum.repos.d/fedora-updates.repo \
		/etc/yum.repos.d/fedora-updates-modular.repo
	;;
39 | 40 | 41)
	sed -e 's|^metalink=|#metalink=|g' \
		-e 's|^#baseurl=http://download.example/pub/fedora/linux|baseurl=https://mirrors.tencentyun.com/fedora|g' \
		-i.bak \
		/etc/yum.repos.d/fedora.repo \
		/etc/yum.repos.d/fedora-updates.repo \
	;;
*)
	echo "Unsupported version: $DIST_VERSION"
	exit 1
	;;
esac
