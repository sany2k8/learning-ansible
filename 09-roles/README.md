# Module 9 — Roles

## Concepts Covered
- **Role Structure**: Organizing tasks, handlers, templates, variables, and defaults into a standardized directory structure.
- **Reusability**: Writing self-contained, shareable roles.
- **Role Dependencies**: Defining dependencies in `meta/main.yml`.

## Default Role Subdirectories
- `tasks/main.yml`: Primary entry point for tasks.
- `handlers/main.yml`: Handlers belonging to this role.
- `defaults/main.yml`: Low-precedence default variables.
- `vars/main.yml`: High-precedence variables.
- `templates/`: Jinja2 templates.
- `files/`: Static files to copy.
- `meta/main.yml`: Metadata and dependency definitions.
