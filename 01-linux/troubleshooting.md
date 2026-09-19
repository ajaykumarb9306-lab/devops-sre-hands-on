# Linux Troubleshooting Guide

Practical commands and troubleshooting flows for common Linux server issues.

## 1. Server Is Slow

Start with:

```bash
uptime
top
free -h
df -h
```

Check CPU-heavy processes:

```bash
ps aux --sort=-%cpu | head -10
```

Check memory-heavy processes:

```bash
ps aux --sort=-%mem | head -10
```

Check load average:

```bash
uptime
```

Check recent system errors:

```bash
journalctl -p err --since "1 hour ago"
```

---

## 2. Disk Is Full

Check filesystem usage:

```bash
df -h
```

Check inode usage:

```bash
df -i
```

Find large directories:

```bash
du -xh /var | sort -rh | head -20
```

Find files larger than 500 MB:

```bash
sudo find / -type f -size +500M 2>/dev/null
```

Check logs:

```bash
du -sh /var/log/*
```

Do not blindly delete files. Identify what is consuming disk space first.

---

## 3. High CPU Usage

Check:

```bash
top
```

or:

```bash
ps aux --sort=-%cpu | head -10
```

Inspect a specific process:

```bash
ps -fp <PID>
```

Check process command:

```bash
cat /proc/<PID>/cmdline
```

If appropriate, terminate normally:

```bash
kill <PID>
```

Use force only when necessary:

```bash
kill -9 <PID>
```

---

## 4. High Memory Usage

Check memory:

```bash
free -h
```

Check processes:

```bash
ps aux --sort=-%mem | head -10
```

Detailed process memory:

```bash
cat /proc/<PID>/status
```

Check for OOM events:

```bash
journalctl -k | grep -i oom
```

or:

```bash
dmesg | grep -i oom
```

---

## 5. Service Is Down

Check service:

```bash
systemctl status <service>
```

Example:

```bash
systemctl status nginx
```

Check logs:

```bash
journalctl -u nginx --since "30 minutes ago"
```

Restart:

```bash
sudo systemctl restart nginx
```

Check again:

```bash
systemctl status nginx
```

Verify process:

```bash
ps aux | grep nginx
```

Verify listening port:

```bash
ss -lntp
```

---

## 6. Application Is Running but Cannot Be Reached

First test locally:

```bash
curl localhost:<port>
```

Example:

```bash
curl localhost:8080
```

Check listening ports:

```bash
ss -lntp
```

Check process:

```bash
ps aux | grep <application>
```

Check IP addresses:

```bash
ip addr
```

Check routes:

```bash
ip route
```

Test remote connectivity:

```bash
nc -zv <host> <port>
```

Possible areas to investigate:

```text
Application
↓
Listening Port
↓
Host Firewall
↓
Cloud Security Group / Firewall
↓
Load Balancer
↓
DNS
↓
Client
```

---

## 7. DNS Problem

Check DNS resolution:

```bash
nslookup example.com
```

or:

```bash
dig example.com
```

Check configured DNS:

```bash
cat /etc/resolv.conf
```

Separate DNS from network problems:

```bash
ping 8.8.8.8
ping google.com
```

If the IP works but the hostname doesn't, investigate DNS.

---

## 8. Port Is Not Listening

Check:

```bash
ss -lntp
```

Search specific port:

```bash
ss -lntp | grep :8080
```

Check service:

```bash
systemctl status <service>
```

Check application logs:

```bash
journalctl -u <service>
```

---

## 9. Permission Denied

Check permissions:

```bash
ls -l <file>
```

Check directory permissions:

```bash
ls -ld <directory>
```

Check ownership:

```bash
stat <file>
```

Check current user:

```bash
whoami
id
```

Change ownership when appropriate:

```bash
sudo chown user:group <file>
```

Change permissions when appropriate:

```bash
chmod 644 <file>
```

For executable scripts:

```bash
chmod +x script.sh
```

---

## 10. SSH Connection Problems

Verbose SSH output:

```bash
ssh -v user@server
```

More detailed debugging:

```bash
ssh -vvv user@server
```

Using a private key:

```bash
ssh -i key.pem ubuntu@server
```

Private key permissions:

```bash
chmod 400 key.pem
```

Common causes:

```text
Wrong username
Wrong private key
Incorrect key permissions
Port 22 blocked
Security group/firewall rule
SSH service not running
Server unreachable
```

---

## 11. Logs

System logs:

```bash
journalctl
```

Current boot:

```bash
journalctl -b
```

Errors:

```bash
journalctl -p err
```

Service logs:

```bash
journalctl -u <service>
```

Follow service logs:

```bash
journalctl -u <service> -f
```

Search traditional log files:

```bash
grep -i "error" /var/log/*
```

---

## General Linux Troubleshooting Workflow

When investigating an incident:

```bash
hostname
date
uptime
free -h
df -h
df -i
systemctl status <service>
journalctl -u <service>
ps aux
ss -lntp
ip addr
ip route
curl localhost:<port>
```

Follow the problem from the infrastructure toward the application:

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
Network
  ↓
DNS / Load Balancer
  ↓
User
```