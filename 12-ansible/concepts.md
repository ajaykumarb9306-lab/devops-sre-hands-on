# Ansible Concepts

## Inventory

Inventory defines the systems Ansible manages.

Example:

[webservers]
server1
server2

## Module

Modules perform actions on managed systems.

Common modules:

- ping
- command
- shell
- copy
- file
- package
- service
- template
- user

## Playbook

Playbooks describe automation in YAML.

## Task

A task executes an Ansible module.

## Variables

Variables make playbooks reusable across environments.

## Facts

Ansible can collect information about managed systems such as:

- Operating system
- Hostname
- IP addresses
- CPU architecture
- Memory

## Handlers

Handlers run only when notified by another task.

A common example is restarting a service after its configuration changes.

## Templates

Ansible uses Jinja2 templates to generate configuration files dynamically.

## Roles

Roles organize reusable automation.

Typical structure:

roles/
└── webserver/
    ├── tasks/
    ├── handlers/
    ├── defaults/
    └── templates/

## Idempotency

An idempotent playbook can run repeatedly without making unnecessary changes.

First run:

changed=3

Second run:

changed=0

when the desired state has already been reached.

## Ansible Vault

Vault encrypts sensitive Ansible data.

Example:

ansible-vault create secrets.yml

Secrets should not be stored as plain text in Git.
