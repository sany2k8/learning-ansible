# Module 1 — Introduction to Ansible

## Concepts Covered
- **Infrastructure as Code (IaC)**: Managing and provisioning infrastructure through machine-readable definition files.
- **Agentless architecture**: No agent software needs to be installed on remote hosts; Ansible uses standard SSH.
- **Push model**: Commands are pushed from a control node (your machine) to managed nodes.
- **SSH communication**: Remote hosts are connected via standard SSH keys.
- **YAML**: Human-readable data serialization language used for writing playbooks.
- **Idempotency**: Operation can be applied multiple times without changing the result beyond the initial application.
- **Playbook lifecycle**: Design, write, lint, dry-run, execute, and verify.

## Practice Commands
Try running the following ad-hoc commands against localhost:

```bash
# Ping the local environment to test Ansible connection
ansible localhost -m ping

# Run shell command to check hostname
ansible localhost -m command -a "hostname"

# Gather system facts
ansible localhost -m setup
```
