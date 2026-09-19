# File Permissions

Create a file:

```bash
touch test.txt
```

View permissions:

```bash
ls -l test.txt
```

Example:

```text
-rw-r--r--
```

Linux permissions are divided into:

```text
Owner | Group | Others
```

Numeric values:

```text
Read    = 4
Write   = 2
Execute = 1
```

Common permissions:

```text
644 = owner read/write, everyone else read
755 = owner read/write/execute, everyone else read/execute
600 = owner read/write only
700 = owner full access only
```

Examples:

```bash
chmod 644 test.txt
chmod 600 test.txt
```

For scripts:

```bash
chmod +x script.sh
```

Change ownership:

```bash
sudo chown user:group test.txt
```

View detailed information:

```bash
stat test.txt
```