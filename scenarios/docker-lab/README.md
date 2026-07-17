# Docker practice hosts (Multipass replacement)

Multipass, Vagrant, and VirtualBox all need hardware virtualization. A normal EC2
instance is itself a VM on the Nitro hypervisor and does not pass KVM through to
guests, so `multipass launch` fails with *"KVM support is not enabled on this
machine"*. Only bare-metal instance types (`c5.metal`, `m5.metal`, …) expose
`/dev/kvm`, and they cost several dollars an hour.

This lab replaces the three VMs with three containers running **systemd as PID 1
and a real sshd**. Ansible connects over SSH, escalates with `sudo`, and manages
services with `systemctl` — every concept in this repo works unchanged, on one
`t3.micro`.

| VM (before)         | Container (now)   |
| ------------------- | ----------------- |
| web1 192.168.64.10  | web1 172.20.0.11  |
| web2 192.168.64.11  | web2 172.20.0.12  |
| db1  192.168.64.20  | db1  172.20.0.20  |

## Install Docker

Use Docker's own repo — the `docker.io` package in the Ubuntu archive ships the
obsolete Compose v1, which does not understand this compose file.

```bash
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker "$USER"
newgrp docker          # or log out and back in
docker compose version # expect v2.x
```

## Start the lab

```bash
cd ~/learning-ansible/scenarios/docker-lab
./lab.sh up
```

That generates `~/.ssh/ansible_lab` if missing, bakes the public key into the
image, starts the three containers, and waits for sshd.

## Use it

From the repo root, point `-i` at the lab inventory:

```bash
ansible -i inventory/docker-lab.yml all -m ping
ansible -i inventory/docker-lab.yml web -m service -a "name=ssh state=started"
ansible-playbook -i inventory/docker-lab.yml playbooks/site.yml
```

To make it the default, edit `ansible.cfg`:

```ini
inventory = inventory/docker-lab.yml
```

Other commands: `./lab.sh status`, `./lab.sh ssh web1`, `./lab.sh down`.
`./lab.sh reset` destroys and rebuilds all three — a clean slate is ~15 seconds,
which is the one way this beats VMs for practicing idempotency.

## What still differs from a VM

The containers share the host kernel, so a handful of tasks behave differently:

- **Kernel-level things fail**: `sysctl`, `ufw`/`iptables`, kernel modules,
  loading `overlay`, mounting filesystems. Practice `roles/firewall` against a
  second EC2 instance, or read the tasks and skip execution.
- **Reboots aren't real**: `ansible.builtin.reboot` will not work. Use
  `./lab.sh reset` when a scenario calls for a restart.
- **Docker-in-Docker** (`roles/docker`, `11-docker/`) needs extra work; run
  those against the EC2 host itself via the `local` group instead.
- These containers are `privileged`, which is fine for a throwaway lab on your
  own instance and is **not** something to copy into production.

Everything else — users, packages, templates, handlers, vault, roles,
conditionals, loops, facts — behaves exactly as it would on a VM.
