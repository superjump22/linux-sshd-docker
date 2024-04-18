# docker run --runtime=sysbox-runc --rm -itd -e ROOT_PASSWORD={{PASSWORD}} -p {{PORT}}:22 superjump22/linux-sshd:fedora-{{VERSION}}
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG DIST_VERSION

COPY *.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/install-ssh.sh /usr/local/bin/start-ssh.sh /usr/local/bin/get-os.sh && \
    DIST_VERSION=${DIST_VERSION} /usr/local/bin/install-ssh.sh

EXPOSE 22

CMD ["/usr/local/bin/start-ssh.sh"]
