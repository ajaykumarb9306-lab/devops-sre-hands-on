# Disk and Filesystem

Filesystem usage:

```bash
df -h
```

Inodes:

```bash
df -i
```

Block devices:

```bash
lsblk
```

Directory size:

```bash
du -sh /var/log
```

Largest directories:

```bash
sudo du -xh /var | sort -rh | head -20
```

Large files:

```bash
sudo find / -type f -size +500M 2>/dev/null
```

Mounted filesystems:

```bash
mount
```

Useful troubleshooting sequence:

```bash
df -h
df -i
lsblk
du -sh /var/*
```