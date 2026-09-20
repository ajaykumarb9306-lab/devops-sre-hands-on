# Linux Network Troubleshooting

Check interfaces:

```bash
ip addr
```

Routes:

```bash
ip route
```

DNS:

```bash
cat /etc/resolv.conf
nslookup example.com
dig example.com
```

Connectivity:

```bash
ping example.com
```

HTTP:

```bash
curl -I https://example.com
```

Listening ports:

```bash
ss -lntp
```

Specific port:

```bash
ss -lntp | grep :8080
```

Remote port:

```bash
nc -zv hostname 443
```

Typical troubleshooting path:

```text
Application
↓
Local Port
↓
Host Network
↓
Firewall / Security Group
↓
Route
↓
DNS
↓
Remote Endpoint
```