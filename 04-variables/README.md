# Module 4 — Variable Scopes & Registration

## Concepts Covered
- **Variable Precedence**: How values override each other (defaults < group < host < play < extra vars).
- **vars & vars_files**: Setting variables inline or referencing external files.
- **register**: Saving task execution output to a variable for reference in later tasks.
- **set_fact**: Dynamically creating variables during execution.

## Practice Playbooks
Run the demo playbook:
```bash
ansible-playbook -i ../inventory/hosts.yml variables_demo.yml
```
