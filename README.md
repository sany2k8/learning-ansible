# Ansible Hands-on Learning Sandbox

A pre-scaffolded, production-ready environment built to support the hands-on learning stages specified in [guideline.md](file:///Users/sany/Projects/learning-ansible/guideline.md).

## Ansible & Environment Setup

Follow these steps to set up your local development machine and practice infrastructure before running any playbooks:

### 1. Install Ansible (macOS / Linux)

#### On macOS
Install using Homebrew:
```bash
brew install ansible ansible-lint yamllint sshpass
```

#### On Linux (Ubuntu)
Install using standard apt packages and PPAs:
```bash
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible ansible-lint yamllint sshpass
```

Verify installation:
```bash
ansible --version
ansible-playbook --version
```

### 2. Set Up Practice VMs (Multipass)
Installs lightweight Ubuntu virtual machines to act as targets:
```bash
# Install Multipass VM manager
brew install multipass

# Spin up learning targets
multipass launch --name web1
multipass launch --name web2
multipass launch --name db1
```

Check VM status and IP addresses:
```bash
multipass list
```
*(Make sure to update the IPs in [hosts.yml](file:///Users/sany/Projects/learning-ansible/inventory/hosts.yml) or [hosts.ini](file:///Users/sany/Projects/learning-ansible/inventory/hosts.ini) if they differ from the defaults!)*

### 3. Configure SSH Key Authentication
Create SSH keys on your host and copy them to all target VMs:
```bash
# Generate keys if you don't already have one
ssh-keygen -t ed25519 -N ""

# Copy the keys to each Multipass VM (default user is 'multipass')
ssh-copy-id multipass@<web1_ip>
ssh-copy-id multipass@<web2_ip>
ssh-copy-id multipass@<db1_ip>
```

### 4. Install Ansible Galaxy Collections
Install required modules (e.g. docker, k8s, aws collections):
```bash
ansible-galaxy collection install -r requirements.yml
```

### 5. Verify the Connection
Test that your machine can ping all hosts:
```bash
ansible all -m ping
```

## Directory Structure

```
.
├── 01-introduction/         # Module 1: Basics, facts, setup
├── 02-inventory/            # Module 2: INI and YAML inventories
├── 03-playbooks/            # Module 3: Ad-hoc translations, installing software
├── 04-variables/            # Module 4: Precedence, registered outputs, set_facts
├── 05-loops/                # Module 5: loop, iteration on dictionaries, nested loops
├── 06-conditionals/         # Module 6: when, conditional installs, distributions
├── 07-templates/            # Module 7: Jinja2 nginx/html configurations
├── 08-handlers/             # Module 8: notify logic on changes
├── 09-roles/                # Module 9: Standard role directory layouts
├── 10-vault/                # Module 10: Secret variable encryption
├── 11-docker/               # Module 11: Deploying container stacks
├── 12-kubernetes/           # Module 12: Deploying resources with k8s core
├── 13-aws/                  # Module 13: Provisioning EC2, security groups, S3
├── 14-projects/             # Module 14: Mini projects catalogue
├── files/                   # Static files configuration storage
├── group_vars/              # Environment/group level overrides
├── host_vars/               # Host-specific parameters overrides
├── inventory/               # Core inventory definitions (INI and YAML)
├── playbooks/               # Ready-to-run site configurations
├── roles/                   # Complete Ansible roles (nginx, postgresql, ufw, etc.)
├── scenarios/               # Standalone scenario-based playbooks (docker, k8s, nginx)
├── templates/               # Systemd, reverse-proxy and backup templates
└── vault/                   # Multi-environment secret management keys
```

## Quick Start Verification

Check syntax and structure of playbooks:

```bash
# Check syntax of all playbooks
ansible-playbook --syntax-check playbooks/site.yml

# Dry-run playbooks (if hosts are active)
ansible-playbook playbooks/site.yml --check
```

## Linting

```bash
# Run yamllint
yamllint .

# Run ansible-lint
ansible-lint
```

## Running Scenario-Based Playbooks

The `scenarios/` directory contains standalone, self-contained playbooks for specific use cases (such as Nginx, Docker, PostgreSQL, CI/CD tools, monitoring, logging, databases, and general infrastructure tasks). **These playbooks are fully compatible and can be used to set up and practice on any Ubuntu instances (e.g. AWS EC2, local Multipass VMs, or bare metal machines).**

You can execute them by specifying target hosts or running them directly on your target Ubuntu instance:

```bash
# 1. Run a setup scenario against all hosts in your inventory
ansible-playbook -i inventory/hosts.yml scenarios/setup_docker.yml

# 2. Run a scenario directly on your local target (e.g. if you cloned the repo onto an AWS EC2 instance)
ansible-playbook -i "localhost," -c local scenarios/setup_nginx.yml

# 3. Mount an EBS volume (modify device and mount vars inside play first)
ansible-playbook -i "localhost," -c local scenarios/aws_mount_ebs.yml

# 4. Install CloudWatch unified agent
ansible-playbook -i "localhost," -c local scenarios/aws_cloudwatch_agent.yml

# 5. Install Jenkins CI/CD (Runs on port 8080)
ansible-playbook -i "localhost," -c local scenarios/setup_jenkins.yml

# 6. Install HashiCorp tools (Terraform, Packer, Vault)
ansible-playbook -i "localhost," -c local scenarios/setup_hashicorp_tools.yml

# 7. Install Portainer Container Manager (Runs on port 9000 / 9443)
ansible-playbook -i "localhost," -c local scenarios/setup_portainer.yml
```

