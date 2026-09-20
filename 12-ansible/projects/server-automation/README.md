# Server Automation Project

Practical Ansible project demonstrating:

- Inventory
- Connectivity
- Facts
- Variables
- File management
- Idempotency
- Roles
- Handlers
- Templates

## Local Lab

Test connectivity:

ansible all -i ../../inventory/hosts.ini -m ping

Run system information playbook:

ansible-playbook -i ../../inventory/hosts.ini ../../playbooks/system-info.yml

Run file automation:

ansible-playbook -i ../../inventory/hosts.ini ../../playbooks/file-management.yml

Run the same playbook again to verify idempotency.

Expected second run:

changed=0
