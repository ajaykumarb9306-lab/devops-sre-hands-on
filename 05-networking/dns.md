# DNS for DevOps & SRE

DNS translates human-readable names into information applications and network clients can use.

## Basic DNS Flow

```text
Application requests:
app.example.com
       ↓
Local DNS cache
       ↓
Configured DNS resolver
       ↓
DNS hierarchy / authoritative DNS
       ↓
IP address returned
       ↓
Application connects to IP
```

## Common DNS Records

```text
A       Hostname → IPv4 address
AAAA    Hostname → IPv6 address
CNAME   Alias → another hostname
MX      Mail server
TXT     Text / verification records
NS      Authoritative name servers
PTR     Reverse DNS
```

## A Record

```text
app.example.com → 203.0.113.10
```

Check:

```bash
dig app.example.com A
```

Short output:

```bash
dig +short app.example.com
```

## CNAME

Example:

```text
www.example.com
      ↓
app.example.com
      ↓
203.0.113.10
```

Check:

```bash
dig www.example.com CNAME
```

## DNS Resolver Configuration

Linux:

```bash
cat /etc/resolv.conf
```

With systemd-resolved:

```bash
resolvectl status
```

## Query Specific DNS Server

```bash
dig @8.8.8.8 example.com
```

This can help compare responses from different resolvers.

## Trace DNS Resolution

```bash
dig +trace example.com
```

## Reverse DNS

```bash
dig -x 8.8.8.8
```

## TTL

DNS records have a TTL (Time To Live).

Example:

```text
300 seconds
```

Resolvers may cache the record for the TTL period.

Check:

```bash
dig example.com
```

The DNS answer includes the remaining TTL.

## DNS Troubleshooting

Start:

```bash
dig app.example.com
```

Then:

```bash
dig +short app.example.com
```

Compare another resolver:

```bash
dig @8.8.8.8 app.example.com
```

Check local configuration:

```bash
cat /etc/resolv.conf
```

Then test the resolved IP:

```bash
ping <IP>
```

Test application port:

```bash
nc -zv <IP> 443
```

If DNS resolves correctly but the application still fails, continue troubleshooting the network and application layers.