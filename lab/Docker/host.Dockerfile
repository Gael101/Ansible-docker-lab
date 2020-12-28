FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y vim openssh-server python3 \
    && mkdir -p ~/.ssh/ \
    && mkdir -p /var/run/sshd \
    && apt-get clean \
    && sed -i 's|^#AuthorizedKeysFile|AuthorizedKeysFile|g' /etc/ssh/sshd_config \
    && sed -i 's|.ssh/authorized_keys|/etc/ssh/authorized_keys|g' /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]