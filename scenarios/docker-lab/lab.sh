#!/usr/bin/env bash
# Manage the container-based practice hosts (web1, web2, db1).
#
#   ./lab.sh up      build + start, wait for SSH
#   ./lab.sh down    stop and remove (state is thrown away)
#   ./lab.sh reset   down + up, for a clean slate between playbook runs
#   ./lab.sh status  show containers
#   ./lab.sh ssh web1
set -euo pipefail

cd "$(dirname "$0")"

KEY="${HOME}/.ssh/ansible_lab"
NODES=(web1 web2 db1)

# Each check reports the specific thing that is wrong; a generic "compose is
# missing" message sends you down the wrong path when Docker is absent entirely.
preflight() {
    if ! command -v docker >/dev/null 2>&1; then
        cat >&2 <<'EOF'
ERROR: Docker is not installed, so there is nothing to run the lab hosts.

    sudo apt update && sudo apt install -y docker.io docker-compose-v2
    sudo usermod -aG docker "$USER" && newgrp docker

Then re-run: ./lab.sh up
EOF
        exit 1
    fi

    if ! docker info >/dev/null 2>&1; then
        cat >&2 <<'EOF'
ERROR: Docker is installed but the daemon is not reachable.

Either it is not running:
    sudo systemctl enable --now docker

or your user is not in the 'docker' group yet (needs a new login shell):
    sudo usermod -aG docker "$USER" && newgrp docker
EOF
        exit 1
    fi

    if ! docker compose version >/dev/null 2>&1; then
        cat >&2 <<'EOF'
ERROR: Docker Compose v2 is missing ('docker compose').

    sudo apt install -y docker-compose-v2

The old python 'docker-compose' (v1) cannot read this compose file.
EOF
        exit 1
    fi
}

compose() {
    docker compose "$@"
}

ensure_key() {
    if [[ ! -f "${KEY}" ]]; then
        echo "==> Generating SSH key ${KEY}"
        ssh-keygen -t ed25519 -N '' -C 'ansible-lab' -f "${KEY}"
    fi
    # The Dockerfile COPYs this from the build context.
    cp "${KEY}.pub" ./ansible_lab.pub
}

wait_for_ssh() {
    echo "==> Waiting for sshd"
    for node in "${NODES[@]}"; do
        for _ in $(seq 1 30); do
            if docker exec "${node}" systemctl is-active ssh >/dev/null 2>&1; then
                echo "    ${node} ready"
                break
            fi
            sleep 1
        done
    done
}

case "${1:-up}" in
    up)
        preflight
        ensure_key
        compose up -d --build
        wait_for_ssh
        echo
        echo "Hosts: web1 172.20.0.11 | web2 172.20.0.12 | db1 172.20.0.20"
        echo "Try:   ansible -i inventory/docker-lab.yml all -m ping"
        ;;
    down)
        preflight
        compose down --remove-orphans
        ;;
    reset)
        preflight
        compose down --remove-orphans
        exec "$0" up
        ;;
    status)
        preflight
        compose ps
        ;;
    ssh)
        preflight
        node="${2:?usage: ./lab.sh ssh <web1|web2|db1>}"
        ip=$(docker inspect -f \
            '{{ (index .NetworkSettings.Networks "ansible-lab").IPAddress }}' "${node}")
        exec ssh -i "${KEY}" -o StrictHostKeyChecking=no \
            -o UserKnownHostsFile=/dev/null "ansible@${ip}"
        ;;
    *)
        echo "usage: $0 {up|down|reset|status|ssh <node>}" >&2
        exit 1
        ;;
esac
