# Module 3 — Playbooks Basics

## Concepts Covered
- **Play**: Maps a set of hosts to a list of tasks.
- **Hosts**: Specifies the target servers for the play.
- **Tasks**: Sequential list of actions executing Ansible modules.
- **Modules**: Reusable units of work (e.g., `apt`, `git`, `user`, `file`).

## Running Playbooks
Run any playbook using the `ansible-playbook` command:

```bash
ansible-playbook -i ../inventory/hosts.ini install_nginx.yml
```
