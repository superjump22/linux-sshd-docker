# CentOS Stream 8 + Systemd + Sshd
# 
# Need to install Sysbox Container Runtime first: https://github.com/nestybox/sysbox
#
# Usage:
#
# $ docker run --runtime=sysbox-runc --rm -itd -e ROOT_PASSWORD={{PASSWORD}} -p {{PORT}}:22 superjump22/linux-vm:centos-stream8

FROM quay.io/centos/centos:stream8

#
# Systemd installation
#
RUN dnf install -y \
        iptables   \
        iproute    \
        kmod       \
        procps-ng  \
        sudo       \
        udev &&    \
    # Unmask services
    systemctl unmask                                                  \
        systemd-remount-fs.service                                    \
        dev-hugepages.mount                                           \
        sys-fs-fuse-connections.mount                                 \
        systemd-logind.service                                        \
        getty.target                                                  \
        console-getty.service &&                                      \
    # Prevents journald from reading kernel messages from /dev/kmsg
    echo "ReadKMsg=no" >> /etc/systemd/journald.conf &&               \
                                                                      \
    # Housekeeping
    dnf clean all &&                                                  \
    rm -rf                                                            \
       /var/cache/dnf/*                                               \
       /var/log/*                                                     \
       /tmp/*                                                         \
       /var/tmp/*                                                     \
       /usr/share/doc/*                                               \
       /usr/share/man/*

# Make use of stopsignal (instead of sigterm) to stop systemd containers.
STOPSIGNAL SIGRTMIN+3

COPY *.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/install-ssh.sh /usr/local/bin/start-ssh.sh /usr/local/bin/get-os.sh && \
    DIST_VERSION=stream8 /usr/local/bin/install-ssh.sh

EXPOSE 22

CMD ["/usr/local/bin/start-ssh.sh"]