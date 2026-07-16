# Module 10 — Ansible Vault

## Concepts Covered
- **Encryption**: Storing sensitive files/variables securely in source control.
- **Commands**:
  - `ansible-vault create vars/secrets.yml` — Create a new encrypted file.
  - `ansible-vault encrypt vars/secrets.yml` — Encrypt an existing file.
  - `ansible-vault decrypt vars/secrets.yml` — Decrypt a file.
  - `ansible-vault edit vars/secrets.yml` — Edit file in-place.
  - `ansible-vault view vars/secrets.yml` — View file content in console.
  - `ansible-vault rekey vars/secrets.yml` — Rotate the vault password.

## Running Playbooks with Vault
You must supply the vault password to run playbooks that decrypt variables:

```bash
# Prompt for vault password in console
ansible-playbook -i ../inventory/hosts.yml vault_demo.yml --ask-vault-pass

# Or read from password file
ansible-playbook -i ../inventory/hosts.yml vault_demo.yml --vault-password-file ~/.vault_pass.txt
```
