# Linux Commands Cheat Sheet

Practical Linux commands for system administration, DevOps, SRE, and troubleshooting.

## System Information

```bash
hostname
hostnamectl
uname -a
cat /etc/os-release
uptime
date
whoami
id
```

Kernel version:

```bash
uname -r
```

CPU information:

```bash
lscpu
```

Memory:

```bash
free -h
```

Live system activity:

```bash
top
```

If installed:

```bash
htop
```

---

## Files and Directories

Current directory:

```bash
pwd
```

List files:

```bash
ls
ls -l
ls -la
ls -lh
```

Create directories:

```bash
mkdir app
mkdir -p app/config/logs
```

Create file:

```bash
touch file.txt
```

Copy:

```bash
cp file.txt backup.txt
cp -r directory/ backup/
```

Move or rename:

```bash
mv old.txt new.txt
mv file.txt /tmp/
```

Remove:

```bash
rm file.txt
rm -r directory/
rm -rf directory/
```

> Be extremely careful with `rm -rf`, especially when running as root.

Find files:

```bash
find /var/log -name "*.log"
```

Find files larger than 100 MB:

```bash
find / -type f -size +100M 2>/dev/null
```

---

## Viewing Files

```bash
cat file.txt
less file.txt
head file.txt
tail file.txt
```

First 20 lines:

```bash
head -n 20 file.txt
```

Last 100 lines:

```bash
tail -n 100 file.txt
```

Follow a log:

```bash
tail -f /var/log/application.log
```

---

## Search and Text Processing

Search inside files:

```bash
grep "ERROR" application.log
```

Case-insensitive:

```bash
grep -i "error" application.log
```

Recursive search:

```bash
grep -R "ERROR" /var/log/
```

Show line numbers:

```bash
grep -n "ERROR" application.log
```

Count matches:

```bash
grep -c "ERROR" application.log
```

Useful pipeline:

```bash
grep "ERROR" application.log | tail -n 20
```

Sort:

```bash
sort file.txt
```

Remove duplicate lines:

```bash
sort file.txt | uniq
```

Count lines:

```bash
wc -l file.txt
```

---

## Permissions

View permissions:

```bash
ls -l
```

Example:

```text
-rwxr-xr--
```

Permission values:

```text
r = read    = 4
w = write   = 2
x = execute = 1
```

Change permissions:

```bash
chmod 644 file.txt
chmod 755 script.sh
```

Make script executable:

```bash
chmod +x script.sh
```

Change owner:

```bash
sudo chown user:group file.txt
```

---

## Users and Groups

Current user:

```bash
whoami
id
```

Logged-in users:

```bash
who
```

Create user:

```bash
sudo useradd -m ajay
```

Set password:

```bash
sudo passwd ajay
```

Create group:

```bash
sudo groupadd devops
```

Add user to group:

```bash
sudo usermod -aG devops ajay
```

View groups:

```bash
groups ajay
```

---

## Processes

List processes:

```bash
ps aux
```

Search for process:

```bash
ps aux | grep nginx
```

Alternative:

```bash
pgrep nginx
pgrep -af nginx
```

Kill process:

```bash
kill <PID>
```

Force kill:

```bash
kill -9 <PID>
```

> Try normal termination before using `kill -9`.

Live process monitoring:

```bash
top
```

Processes using the most CPU:

```bash
ps aux --sort=-%cpu | head
```

Processes using the most memory:

```bash
ps aux --sort=-%mem | head
```

---

## Services — systemd

Check service:

```bash
systemctl status nginx
```

Start:

```bash
sudo systemctl start nginx
```

Stop:

```bash
sudo systemctl stop nginx
```

Restart:

```bash
sudo systemctl restart nginx
```

Reload:

```bash
sudo systemctl reload nginx
```

Enable at boot:

```bash
sudo systemctl enable nginx
```

Disable:

```bash
sudo systemctl disable nginx
```

Check whether active:

```bash
systemctl is-active nginx
```

---

## Logs — journalctl

Service logs:

```bash
journalctl -u nginx
```

Follow logs:

```bash
journalctl -u nginx -f
```

Recent logs:

```bash
journalctl -u nginx --since "1 hour ago"
```

Current boot:

```bash
journalctl -b
```

Errors:

```bash
journalctl -p err
```

---

## Disk and Filesystems

Disk usage:

```bash
df -h
```

Directory size:

```bash
du -sh /var/log
```

Largest directories:

```bash
du -h /var | sort -hr | head -20
```

Block devices:

```bash
lsblk
```

Mounted filesystems:

```bash
mount
```

Inode usage:

```bash
df -i
```

---

## Networking

Interfaces and IP addresses:

```bash
ip addr
```

Routes:

```bash
ip route
```

Test connectivity:

```bash
ping google.com
```

DNS lookup:

```bash
nslookup google.com
```

or:

```bash
dig google.com
```

Test HTTP:

```bash
curl https://example.com
```

Headers only:

```bash
curl -I https://example.com
```

Listening ports:

```bash
ss -tulpn
```

Check specific port:

```bash
ss -lntp | grep :80
```

Test remote TCP port:

```bash
nc -zv hostname 443
```

---

## SSH

Connect:

```bash
ssh user@server
```

Using private key:

```bash
ssh -i key.pem ubuntu@server
```

Fix private-key permissions:

```bash
chmod 400 key.pem
```

Copy file to server:

```bash
scp file.txt user@server:/tmp/
```

Using a key:

```bash
scp -i key.pem file.txt ubuntu@server:/tmp/
```

---

## Package Management

Ubuntu/Debian:

```bash
sudo apt update
sudo apt install nginx
sudo apt remove nginx
```

RHEL/Rocky/Alma:

```bash
sudo dnf install nginx
sudo dnf remove nginx
```

---

## Archives

Create tar archive:

```bash
tar -cvf backup.tar directory/
```

Compress:

```bash
tar -czvf backup.tar.gz directory/
```

Extract:

```bash
tar -xzvf backup.tar.gz
```

---

## Command History

```bash
history
```

Search:

```bash
history | grep docker
```

Interactive history search:

```text
Ctrl + R
```

---

## Useful SRE Troubleshooting Flow

When someone says:

> "The Linux server/application is down."

Start with:

```bash
uptime
free -h
df -h
df -i
systemctl status <service>
journalctl -u <service> --since "30 minutes ago"
ps aux
ss -tulpn
ip addr
ip route
curl localhost:<port>
```

Think through the path:

```text
Server reachable?
      ↓
CPU / Memory / Disk healthy?
      ↓
Service running?
      ↓
Process listening?
      ↓
Correct port?
      ↓
Application responding locally?
      ↓
Network/DNS/Firewall?
      ↓
Application logs?
```