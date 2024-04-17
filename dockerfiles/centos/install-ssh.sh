#!/bin/bash
yum update -y
yum install -y openssh-server
rm -rf /var/cache/yum/*
mkdir -p /var/run/sshd
