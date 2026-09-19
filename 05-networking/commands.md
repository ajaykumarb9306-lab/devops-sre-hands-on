# Networking Commands Cheat Sheet

Practical networking commands for troubleshooting Linux systems and applications.

## Interfaces and IP Addresses

```bash
ip addr
```

Short form:

```bash
ip a
```

Specific interface:

```bash
ip addr show eth0
```

---

## Routing

```bash
ip route
```

Route to a specific destination:

```bash
ip route get 8.8.8.8
```

---

## Connectivity

```bash
ping google.com
```

Limited count:

```bash
ping -c 4 google.com
```

Test by IP:

```bash
ping 8.8.8.8
```

This can help distinguish name-resolution problems from basic IP connectivity problems.

---

## DNS

```bash
nslookup example.com
```

Using `dig`:

```bash
dig example.com
```

Short answer:

```bash
dig +short example.com
```

Specific DNS server:

```bash
dig @8.8.8.8 example.com
```

MX records:

```bash
dig MX example.com
```

Nameservers:

```bash
dig NS example.com
```

---

## Listening Ports

```bash
ss -lntp
```

TCP:

```bash
ss -lnt
```

UDP:

```bash
ss -lnu
```

Specific port:

```bash
ss -lntp | grep :8080
```

---

## Network Connections

```bash
ss -tunap
```

Established TCP connections:

```bash
ss -tn state established
```

---

## Test TCP Port

```bash
nc -zv example.com 443
```

Example:

```bash
nc -zv 10.0.2.10 8080
```

---

## HTTP Testing

Basic request:

```bash
curl https://example.com
```

Headers:

```bash
curl -I https://example.com
```

Verbose:

```bash
curl -v https://example.com
```

Follow redirects:

```bash
curl -L https://example.com
```

Save response:

```bash
curl -o output.html https://example.com
```

HTTP status only:

```bash
curl -s -o /dev/null -w "%{http_code}\n" https://example.com
```

Response timing:

```bash
curl -s -o /dev/null \
-w "HTTP: %{http_code}\nTotal: %{time_total}s\n" \
https://example.com
```

---

## TLS Testing

Inspect HTTPS/TLS connection:

```bash
openssl s_client -connect example.com:443
```

Send hostname using SNI:

```bash
openssl s_client \
-connect example.com:443 \
-servername example.com
```

Inspect certificate dates:

```bash
echo | openssl s_client \
-connect example.com:443 \
-servername example.com 2>/dev/null |
openssl x509 -noout -dates
```

---

## Network Path

```bash
traceroute example.com
```

On some systems:

```bash
tracepath example.com
```

Remember that intermediate devices may block or deprioritize traceroute-related traffic, so missing hops do not automatically prove the application path is broken.

---

## ARP / Neighbor Table

Modern Linux:

```bash
ip neigh
```

---

## DNS Configuration

```bash
cat /etc/resolv.conf
```

On systems using systemd-resolved:

```bash
resolvectl status
```

---

## Network Interface Statistics

```bash
ip -s link
```

---

## Process Using a Port

Using `ss`:

```bash
sudo ss -lntp
```

Using `lsof` if installed:

```bash
sudo lsof -i :8080
```

---

## Public IP

When Internet access is available, an external service can report the egress public IP:

```bash
curl https://ifconfig.me
```

In cloud environments this may represent a NAT gateway, proxy, load balancer, or other egress device rather than the VM's interface address.

---

## Useful Troubleshooting Sequence

```bash
ip addr
ip route
cat /etc/resolv.conf
ping <destination>
dig <hostname>
ss -lntp
nc -zv <host> <port>
curl -v <url>
```

Think through:

```text
Do I have an IP?
       ↓
Do I have a route?
       ↓
Does DNS resolve?
       ↓
Can I reach the destination?
       ↓
Is the required port reachable?
       ↓
Does TCP connect?
       ↓
Does TLS work?
       ↓
Does the application respond?
```