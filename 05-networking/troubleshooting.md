# Network Troubleshooting Guide

Practical network troubleshooting workflows for DevOps and SRE.

## 1. Connection Refused

Example:

```text
Connection refused
```

Usually means the destination was reachable, but the attempted TCP connection was actively rejected.

Check whether the application is listening:

```bash
ss -lntp
```

Specific port:

```bash
ss -lntp | grep :8080
```

Check service:

```bash
systemctl status <service>
```

Test locally:

```bash
curl localhost:8080
```

Common causes:

```text
Application stopped
Wrong port
Application listening on another interface
Service failed during startup
Firewall actively rejecting traffic
```

---

## 2. Connection Timeout

Example:

```text
Connection timed out
```

Investigate:

```bash
ping <host>
ip route
nc -zv <host> <port>
```

Possible causes:

```text
Firewall dropping traffic
Cloud firewall / security rule
Routing problem
Network ACL
Incorrect IP
Destination unavailable
Load balancer/network path problem
```

A timeout and connection refused are different signals.

---

## 3. DNS Resolves but HTTPS Fails

Confirm DNS:

```bash
dig +short app.example.com
```

Test TCP:

```bash
nc -zv app.example.com 443
```

Test TLS/HTTP:

```bash
curl -v https://app.example.com
```

TLS inspection:

```bash
openssl s_client \
-connect app.example.com:443 \
-servername app.example.com
```

Think through:

```text
DNS works
   ↓
TCP 443?
   ↓
TLS handshake?
   ↓
HTTP response?
   ↓
Application?
```

---

## 4. Application Works Locally but Not Remotely

Local:

```bash
curl localhost:8080
```

If that succeeds, check listening address:

```bash
ss -lntp | grep :8080
```

If application listens only on:

```text
127.0.0.1:8080
```

it is available only through the loopback interface.

For remote access, applications commonly need to listen on an appropriate network interface, for example:

```text
0.0.0.0:8080
```

when that behavior is intended.

Then investigate:

```text
Host firewall
Cloud firewall/security group
Subnet/network ACL
Route
Load balancer
```

---

## 5. Port Is Listening but Remote Connection Fails

Verify locally:

```bash
ss -lntp | grep :443
```

Test locally:

```bash
curl https://localhost
```

From another machine:

```bash
nc -zv <server-ip> 443
```

Then inspect the path:

```text
Client
  ↓
Client route
  ↓
Network firewall
  ↓
Cloud firewall/security rule
  ↓
Server firewall
  ↓
Listening port
  ↓
Application
```

---

## 6. HTTP 502 Bad Gateway

A 502 commonly indicates a proxy or gateway received an invalid/unusable response from an upstream service.

Typical architecture:

```text
Client
  ↓
Load Balancer / Proxy
  ↓
Backend Application
```

Investigate:

```text
Backend process running?
Correct backend port?
Backend reachable from proxy?
Application crashing?
Protocol mismatch?
Proxy configuration correct?
```

Test backend directly when appropriate:

```bash
curl http://<backend-ip>:<port>
```

---

## 7. HTTP 503 Service Unavailable

A 503 indicates the service is currently unavailable.

Common areas to investigate:

```text
No healthy backends
Application unavailable
Service overloaded
Maintenance mode
Health checks failing
Dependency unavailable
```

Check:

```bash
systemctl status <service>
ss -lntp
curl localhost:<port>
```

If behind a load balancer, inspect backend health.

---

## 8. HTTP 504 Gateway Timeout

A 504 commonly means a gateway or proxy did not receive a timely response from an upstream service.

Architecture:

```text
Client
  ↓
Load Balancer / Proxy
  ↓
Application
  ↓
Database / API / Dependency
```

Investigate:

```text
Slow backend
Database latency
Dependency timeout
Network latency
Application thread/resource exhaustion
Timeout configuration
```

Measure request time:

```bash
curl -s -o /dev/null \
-w "HTTP: %{http_code}\nTotal: %{time_total}s\n" \
https://app.example.com
```

---

## 9. Load Balancer Backend Is Unhealthy

Check the health-check configuration:

```text
Protocol
Port
Path
Expected response
Timeout
Interval
```

Example:

```text
HTTP
Port 8080
/health
Expected 200
```

Test directly:

```bash
curl -v http://<backend-ip>:8080/health
```

Check:

```bash
ss -lntp | grep :8080
```

Then verify firewall rules allow health-check traffic.

---

## 10. TLS / Certificate Problem

Test:

```bash
curl -v https://app.example.com
```

Inspect certificate:

```bash
openssl s_client \
-connect app.example.com:443 \
-servername app.example.com
```

Certificate dates:

```bash
echo | openssl s_client \
-connect app.example.com:443 \
-servername app.example.com 2>/dev/null |
openssl x509 -noout -dates
```

Inspect subject and issuer:

```bash
echo | openssl s_client \
-connect app.example.com:443 \
-servername app.example.com 2>/dev/null |
openssl x509 -noout -subject -issuer
```

Investigate:

```text
Expired certificate
Hostname mismatch
Missing certificate chain
Untrusted CA
Incorrect TLS configuration
Wrong certificate attached to listener
```

---

## 11. Determine Which Process Owns a Port

```bash
sudo ss -lntp | grep :8080
```

Or:

```bash
sudo lsof -i :8080
```

Then inspect the process:

```bash
ps -fp <PID>
```

---

## 12. General Network Troubleshooting Flow

Start at the lowest useful layer and move upward:

```bash
ip addr
ip route
cat /etc/resolv.conf
dig <hostname>
ping <host>
nc -zv <host> <port>
curl -v <url>
```

Then:

```text
IP configuration
      ↓
Routing
      ↓
DNS
      ↓
Network connectivity
      ↓
TCP port
      ↓
TLS
      ↓
HTTP
      ↓
Application
      ↓
Backend dependencies
```

Avoid changing multiple layers at once. Identify where communication stops first.