# Module 2 — Inventory Management

## Concepts Covered
- **INI vs YAML**: Two primary formats to write Ansible inventories.
- **Hosts & Groups**: Logical grouping of servers (e.g., `[web]`, `[db]`).
- **Host Variables**: Variables defined directly inline or in `host_vars/`.
- **Group Variables**: Variables applying to groups defined inline or in `group_vars/`.
- **Nested Groups**: Groups containing other groups (`[production:children]`).
- **Dynamic Inventory**: Fetching hosts programmatically (AWS, GCP, Netbox, etc.).

## Practice Exercises
Verify host lists using ad-hoc commands:

```bash
# List all hosts in the default inventory
ansible all --list-hosts

# Ping all web servers using custom INI inventory
ansible web -i inventory.ini -m ping
```
