#!/bin/bash
if [ -z "$SSH_PWD" ]; then
    echo "SSH_PWD not set"
    exit 1
fi
if [ -z "$SSH_PORT" ]; then
    echo "SSH_PORT not set"
    exit 1
fi
sed -i "s/#Port 22/Port $SSH_PORT/" /etc/ssh/sshd_config
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config
echo "root:$SSH_PWD" | chpasswd
/usr/sbin/sshd -D
