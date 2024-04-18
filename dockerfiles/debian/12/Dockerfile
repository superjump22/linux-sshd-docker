# Debian 12 + Systemd + Sshd
# 
# Need to install Sysbox Container Runtime first: https://github.com/nestybox/sysbox
#
# Usage:
#
# $ docker run --runtime=sysbox-runc --rm -itd -p {{PORT}}:22 superjump22/linux-vm:debian-12

FROM debian:12

ENV DEBIAN_FRONTEND=noninteractive

COPY *.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/*.sh && \
    /usr/local/bin/init.sh && \
    rm -f /usr/local/bin/init.sh

EXPOSE 22

# Set systemd as entrypoint.
ENTRYPOINT [ "/sbin/init", "--log-level=err" ]
