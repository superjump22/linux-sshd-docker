#!/bin/bash
if [ -z "$SSH_PWD" ]; then
    echo "SSH_PWD not set"
    exit 1
fi
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config
echo "root:$SSH_PWD" | chpasswd
ssh-keygen -A
/usr/sbin/sshd -D
