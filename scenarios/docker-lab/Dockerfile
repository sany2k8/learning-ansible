# A container that behaves like a small Ubuntu VM: systemd as PID 1, sshd,
# a passwordless-sudo 'ansible' user. Ansible connects over real SSH.
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV container=docker

RUN apt-get update && apt-get install -y --no-install-recommends \
        systemd \
        systemd-sysv \
        openssh-server \
        sudo \
        python3 \
        python3-apt \
        iproute2 \
        iputils-ping \
        curl \
        ca-certificates \
        vim-tiny \
    && rm -rf /var/lib/apt/lists/*

# Units that need real hardware or a real console hang or spam errors in a container.
RUN find /etc/systemd/system /lib/systemd/system -path '*.wants/*' \
        \( -name '*udev*' \
        -o -name '*getty*' \
        -o -name '*console*' \
        -o -name '*systemd-logind*' \
        -o -name '*systemd-timesyncd*' \
        -o -name '*systemd-resolved*' \
        -o -name '*networkd*' \) \
        -exec rm -f {} \;

RUN useradd --create-home --shell /bin/bash ansible \
    && echo 'ansible ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/90-ansible \
    && chmod 0440 /etc/sudoers.d/90-ansible \
    && install -d -o ansible -g ansible -m 0700 /home/ansible/.ssh

COPY ansible_lab.pub /home/ansible/.ssh/authorized_keys
RUN chown ansible:ansible /home/ansible/.ssh/authorized_keys \
    && chmod 0600 /home/ansible/.ssh/authorized_keys

# systemctl enable can't talk to a running systemd during build, so link the unit directly.
RUN mkdir -p /run/sshd /etc/systemd/system/multi-user.target.wants \
    && ln -sf /lib/systemd/system/ssh.service \
        /etc/systemd/system/multi-user.target.wants/ssh.service

EXPOSE 22

# systemd shuts down cleanly on SIGRTMIN+3, not SIGTERM.
STOPSIGNAL SIGRTMIN+3

CMD ["/sbin/init"]
