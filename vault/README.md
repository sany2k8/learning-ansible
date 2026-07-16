# Vault Directory

This directory stores vault-encrypted secrets.

## How to Encrypt
Run the following command to encrypt the secrets file:

```bash
ansible-vault encrypt secrets.yml
```

Enter a strong vault password. You will need this password when running playbooks referencing this file.

## How to Decrypt
To view or decrypt the file:

```bash
# Temporarily decrypt to stdout
ansible-vault view secrets.yml

# Permanently decrypt the file
ansible-vault decrypt secrets.yml
```
