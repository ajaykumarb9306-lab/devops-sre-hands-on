# Linux Log Troubleshooting

System journal:

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

Service:

```bash
journalctl -u nginx
```

Recent service logs:

```bash
journalctl -u nginx --since "30 minutes ago"
```

Follow logs:

```bash
journalctl -u nginx -f
```

Search log file:

```bash
grep -i "error" application.log
```

Include line numbers:

```bash
grep -in "error" application.log
```

Last 100 lines:

```bash
tail -n 100 application.log
```

Follow file:

```bash
tail -f application.log
```

Useful combination:

```bash
tail -n 1000 application.log | grep -iE "error|failed|exception|critical"
```