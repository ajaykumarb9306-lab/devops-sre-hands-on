# Ansible Command Reference

## Version

ansible --version
ansible-playbook --version

## Inventory

ansible-inventory -i inventory/hosts.ini --list
ansible-inventory -i inventory/hosts.ini --graph

## Connectivity

ansible all -i inventory/hosts.ini -m ping

## Ad-Hoc Commands

ansible all -i inventory/hosts.ini -m command -a "hostname"
ansible all -i inventory/hosts.ini -m command -a "uptime"

## Gather Facts

ansible all -i inventory/hosts.ini -m setup

## Run Playbook

ansible-playbook -i inventory/hosts.ini playbooks/system-info.yml

## Syntax Check

ansible-playbook --syntax-check playbooks/system-info.yml

## Dry Run

ansible-playbook --check playbooks/system-info.yml

## Limit Hosts

ansible-playbook playbook.yml --limit webservers

## Verbose Troubleshooting

ansible-playbook -vv playbook.yml
ansible-playbook -vvv playbook.yml

## List Tasks

ansible-playbook playbook.yml --list-tasks

## List Hosts

ansible-playbook playbook.yml --list-hosts

## Vault

ansible-vault create secrets.yml
ansible-vault edit secrets.yml
ansible-vault view secrets.yml
ansible-vault encrypt secrets.yml
ansible-vault decrypt secrets.yml
