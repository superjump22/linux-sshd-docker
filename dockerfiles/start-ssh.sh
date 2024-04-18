#!/bin/bash
if [ -z "$ROOT_PASSWORD" ]; then
    echo "ROOT_PASSWORD not set"
    exit 1
fi
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config
echo "root:$ROOT_PASSWORD" | chpasswd
ssh-keygen -A
/usr/sbin/sshd -D
