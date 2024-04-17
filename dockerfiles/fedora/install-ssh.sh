#!/bin/bash
dnf update -y
dnf install -y openssh-server
rm -rf /var/cache/dnf/*
mkdir -p /var/run/sshd
