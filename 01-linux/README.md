# Linux for DevOps & SRE

Practical Linux commands, scripts, troubleshooting guides, and hands-on examples for DevOps and Site Reliability Engineering.

## Topics Covered

- Linux system information
- Files and directories
- Users and groups
- File permissions and ownership
- Processes
- CPU and memory
- systemd services
- Disk and filesystem management
- Networking and ports
- DNS troubleshooting
- SSH
- Logs and journalctl
- Package management
- Linux troubleshooting

## Repository Structure

```text
01-linux/
├── README.md
├── commands.md
├── troubleshooting.md
├── scripts/
│   ├── system-health-check.sh
│   ├── disk-usage-alert.sh
│   ├── service-check.sh
│   └── log-search.sh
└── labs/
    ├── 01-file-permissions.md
    ├── 02-users-groups.md
    ├── 03-process-management.md
    ├── 04-systemd-services.md
    ├── 05-disk-filesystem.md
    ├── 06-network-troubleshooting.md
    └── 07-log-troubleshooting.md
```

## Quick Server Health Check

```bash
uptime
free -h
df -h
df -i
ps aux --sort=-%cpu | head
ps aux --sort=-%mem | head
ss -lntp
systemctl --failed
journalctl -p err
```

## Scripts

Make a script executable:

```bash
chmod +x scripts/system-health-check.sh
```

Run:

```bash
./scripts/system-health-check.sh
```

Service check:

```bash
./scripts/service-check.sh nginx
```

Disk check:

```bash
./scripts/disk-usage-alert.sh
```

Log search:

```bash
./scripts/log-search.sh /var/log/syslog error
```

## Troubleshooting Approach

```text
Server
  ↓
CPU / Memory / Disk
  ↓
Process
  ↓
Service
  ↓
Port
  ↓
Application
  ↓
Network / DNS
  ↓
Client
```

See [commands.md](commands.md) for commands and [troubleshooting.md](troubleshooting.md) for troubleshooting workflows.