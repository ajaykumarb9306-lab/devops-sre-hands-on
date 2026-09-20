# Process Management

View processes:

```bash
ps aux
```

Search:

```bash
pgrep -af nginx
```

Live monitoring:

```bash
top
```

Top CPU consumers:

```bash
ps aux --sort=-%cpu | head
```

Top memory consumers:

```bash
ps aux --sort=-%mem | head
```

Inspect process:

```bash
ps -fp <PID>
```

Terminate:

```bash
kill <PID>
```

Force termination only when necessary:

```bash
kill -9 <PID>
```

Run process in background:

```bash
sleep 300 &
```

Find its PID:

```bash
pgrep sleep
```

View shell jobs:

```bash
jobs
```