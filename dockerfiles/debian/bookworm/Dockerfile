FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y openssh-server && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd && \
    sed -i "s/#Port 22/Port 2222/" /etc/ssh/sshd_config && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN echo '#!/bin/bash' >> /usr/local/bin/start-ssh.sh && \
    echo 'if [ -z "$SSH_PWD" ]; then' >> /usr/local/bin/start-ssh.sh && \
    echo '    echo "SSH_PWD not set"' >> /usr/local/bin/start-ssh.sh && \
    echo '    exit 1' >> /usr/local/bin/start-ssh.sh && \
    echo 'fi' >> /usr/local/bin/start-ssh.sh && \
    echo 'echo "root:$SSH_PWD" | chpasswd' >> /usr/local/bin/start-ssh.sh && \
    echo '/usr/sbin/sshd -D' >> /usr/local/bin/start-ssh.sh && \
    chmod +x /usr/local/bin/start-ssh.sh

ENV SSH_PWD **String**

EXPOSE 2222

# docker run --rm -itd --network=host -e SSH_PWD=**PASSWORD**
CMD ["/usr/local/bin/start-ssh.sh"]
