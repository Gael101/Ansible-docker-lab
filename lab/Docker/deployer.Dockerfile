FROM debian:bullseye-slim
COPY /lab/Docker/init_cfg/ /etc/copydir/
RUN apt-get update && apt-get install python3-pip --no-install-recommends --assume-yes \
    && pip3 install ansible \
    && apt-get install -y vim net-tools telnet curl openssh-client \
    && mkdir -p /etc/ansible \
    && mv /etc/copydir/ansible.cfg /etc/ansible/ansible.cfg \
    && rm -rf /etc/copydir && apt-get clean && apt-get autoremove \
    && mkdir -p /root/.ssh/ \
    && echo 'eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa' >> ~/.bashrc
CMD [ "tail", "-f", "/dev/null" ]