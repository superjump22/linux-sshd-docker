# docker run --rm -itd --network=host -e SSH_PWD=**PASSWORD** -e SSH_PORT=**PORT** superjump22/linux-sshd:ubuntu-20.04
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

COPY ./install-ssh.sh /usr/local/bin/install-ssh.sh
COPY ./start-ssh.sh /usr/local/bin/start-ssh.sh

RUN chmod +x /usr/local/bin/install-ssh.sh && \
    chmod +x /usr/local/bin/start-ssh.sh && \
    /usr/local/bin/install-ssh.sh

CMD ["/usr/local/bin/start-ssh.sh"]
