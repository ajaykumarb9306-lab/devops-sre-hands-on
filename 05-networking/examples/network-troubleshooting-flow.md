# End-to-End Network Troubleshooting Example

Scenario:

```text
https://app.example.com is unavailable
```

## Step 1 — DNS

```bash
dig +short app.example.com
```

Question:

```text
Does the hostname resolve to the expected destination?
```

## Step 2 — TCP Connectivity

```bash
nc -zv app.example.com 443
```

Question:

```text
Can a TCP connection be established to port 443?
```

## Step 3 — TLS and HTTP

```bash
curl -v https://app.example.com
```

Look for:

```text
DNS resolution
TCP connection
TLS handshake
HTTP status
Response time
```

## Step 4 — Load Balancer

If the request reaches the load balancer but returns:

```text
502
503
504
```

inspect:

```text
Backend health
Health checks
Backend ports
Application availability
Timeouts
```

## Step 5 — Backend Server

Connect to the backend and check:

```bash
systemctl status <application>
```

```bash
ss -lntp
```

Test locally:

```bash
curl localhost:<application-port>
```

## Step 6 — Application Logs

```bash
journalctl -u <application> --since "30 minutes ago"
```

or:

```bash
tail -n 100 application.log
```

## Step 7 — Dependencies

If the application is running but requests still fail, investigate dependencies:

```text
Database
Cache
External API
DNS
Storage
Authentication service
```

## Complete Request Path

```text
User
 ↓
DNS
 ↓
Public IP
 ↓
Firewall / WAF
 ↓
Load Balancer
 ↓
Backend Firewall
 ↓
Application Port
 ↓
Application
 ↓
Database / API / Other Dependency
```

The goal is to identify the first layer where expected communication stops.