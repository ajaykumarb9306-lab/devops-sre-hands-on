# Networking for DevOps & SRE

Practical networking concepts, commands, and troubleshooting workflows used in infrastructure, cloud, containers, Kubernetes, and SRE.

## Topics

- IP addresses
- Private vs public IPs
- IPv4 and CIDR
- Subnets
- Default gateways
- Routing
- TCP and UDP
- Ports
- DNS
- HTTP and HTTPS
- TLS
- NAT
- Firewalls
- Load balancers
- Connectivity troubleshooting

## Structure

```text
05-networking/
├── README.md
├── commands.md
├── fundamentals.md
├── dns.md
├── troubleshooting.md
└── examples/
    └── network-troubleshooting-flow.md
```

## Common Troubleshooting Flow

```text
Application
    ↓
Listening Port
    ↓
Host Network
    ↓
Firewall
    ↓
Route
    ↓
Load Balancer
    ↓
DNS
    ↓
Client
```

## Quick Network Check

Linux:

```bash
ip addr
ip route
ss -lntp
ping <host>
dig <hostname>
curl -v <url>
nc -zv <host> <port>
```

Windows PowerShell:

```powershell
Get-NetIPConfiguration
Get-NetRoute
Get-NetTCPConnection -State Listen
Test-Connection <host>
Resolve-DnsName <hostname>
Test-NetConnection <host> -Port <port>
```