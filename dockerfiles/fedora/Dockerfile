# docker run --rm -itd --network=host -e SSH_PWD={{PASSWORD}} -e SSH_PORT={{PORT}} superjump22/linux-sshd:fedora-{{VERSION}}
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG DIST_VERSION

COPY *.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/install-ssh.sh /usr/local/bin/start-ssh.sh /usr/local/bin/get-os.sh && \
    DIST_VERSION=${DIST_VERSION} /usr/local/bin/install-ssh.sh

CMD ["/usr/local/bin/start-ssh.sh"]
