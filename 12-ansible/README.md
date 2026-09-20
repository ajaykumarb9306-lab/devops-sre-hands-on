# Ansible Hands-On

Practical Ansible reference for DevOps and SRE automation.

## What Ansible Does

Ansible automates:

- Server configuration
- Package installation
- Service management
- Application deployment
- Configuration management
- Operational tasks

Architecture:

Control Node
    |
    | SSH
    v
Managed Nodes

Ansible is agentless. Managed Linux hosts normally require SSH and Python.

## Core Components

Inventory
    |
Playbook
    |
Tasks
    |
Modules
    |
Managed Hosts

## Basic Workflow

ansible-inventory -i inventory/hosts.ini --list

ansible all -i inventory/hosts.ini -m ping

ansible-playbook -i inventory/hosts.ini playbooks/system-info.yml

## Important Concepts

- Inventory
- Modules
- Playbooks
- Tasks
- Variables
- Facts
- Handlers
- Templates
- Roles
- Idempotency
- Vault

## Security

Never commit:

- SSH private keys
- Passwords
- Vault passwords
- API tokens
- Cloud credentials
