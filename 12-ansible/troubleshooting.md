# Ansible Troubleshooting

## Host Unreachable

Check inventory:

ansible-inventory -i inventory/hosts.ini --graph

Test connectivity:

ansible all -i inventory/hosts.ini -m ping

For remote Linux hosts also verify:

- DNS or IP address
- SSH connectivity
- SSH username
- SSH private key
- Firewall rules
- Port 22

## Permission Denied

Test SSH directly:

ssh USER@SERVER

Verify:

- Correct user
- Correct SSH key
- File permissions on private key
- sudo permissions

## Python Problems

Check Python:

python3 --version

Remote managed nodes generally require Python for standard Ansible modules.

## YAML or Playbook Errors

Run:

ansible-playbook --syntax-check PLAYBOOK.yml

Common causes:

- Incorrect indentation
- Invalid YAML
- Incorrect module name
- Missing variables

## Undefined Variable

Run with additional verbosity:

ansible-playbook -vv PLAYBOOK.yml

Check:

- Variable spelling
- defaults
- vars files
- inventory variables

## Task Failed

Run:

ansible-playbook -vvv PLAYBOOK.yml

Read:

- task name
- module error
- return code
- stdout
- stderr

## Idempotency Problems

Run the same playbook twice.

If the second execution continues reporting changes, inspect tasks for non-idempotent command or shell usage.

Prefer purpose-built modules where possible.

## Standard Troubleshooting Flow

ansible --version
ansible-inventory -i inventory/hosts.ini --graph
ansible all -i inventory/hosts.ini -m ping
ansible-playbook --syntax-check PLAYBOOK.yml
ansible-playbook -vv PLAYBOOK.yml
