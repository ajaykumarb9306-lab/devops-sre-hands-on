# systemd Service Management

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

Reload configuration:

```bash
sudo systemctl reload nginx
```

Enable at boot:

```bash
sudo systemctl enable nginx
```

Check:

```bash
systemctl is-active nginx
systemctl is-enabled nginx
```

View service logs:

```bash
journalctl -u nginx
```

Follow logs:

```bash
journalctl -u nginx -f
```

List failed services:

```bash
systemctl --failed
```