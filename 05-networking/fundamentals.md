# Networking Fundamentals

## IP Address

An IP address identifies a network interface.

Example IPv4 address:

```text
192.168.1.25
```

IPv4 addresses contain 32 bits.

---

## Private IPv4 Ranges

Common private address ranges:

```text
10.0.0.0/8

172.16.0.0/12

192.168.0.0/16
```

Private IP addresses are commonly used inside:

```text
Corporate networks
Cloud VPCs/VNets
Home networks
Kubernetes clusters
Private data centers
```

They are not directly routable over the public Internet.

---

## Public IP Address

A public IP can be routable across the Internet, subject to routing and security controls.

Typical cloud architecture:

```text
Internet
   ↓
Public Load Balancer
   ↓
Private Application Servers
   ↓
Private Database
```

Application servers and databases often do not need public IP addresses.

---

## CIDR

CIDR defines an IP network and prefix length.

Example:

```text
10.0.1.0/24
```

A `/24` IPv4 network contains:

```text
256 total addresses
```

Common IPv4 sizes:

```text
/32 = 1 address
/30 = 4 addresses
/29 = 8 addresses
/28 = 16 addresses
/27 = 32 addresses
/26 = 64 addresses
/25 = 128 addresses
/24 = 256 addresses
/16 = 65,536 addresses
```

Cloud providers may reserve some addresses inside each subnet.

---

## Subnet

A subnet divides a larger network into smaller networks.

Example:

```text
VPC
10.0.0.0/16

├── 10.0.1.0/24   Web
├── 10.0.2.0/24   Application
└── 10.0.3.0/24   Database
```

Subnets help organize and control network traffic.

---

## Default Gateway

When a destination is outside the local network, traffic is normally sent toward a gateway according to the routing table.

Linux:

```bash
ip route
```

Example:

```text
default via 10.0.1.1 dev eth0
```

---

## Routing

Routing determines where packets should be sent.

Linux:

```bash
ip route
```

Example:

```text
default via 10.0.1.1
10.0.1.0/24 dev eth0
```

Conceptually:

```text
Destination
    ↓
Routing Table
    ↓
Matching Route
    ↓
Next Hop / Interface
```

---

## TCP

TCP is connection-oriented and provides reliable, ordered delivery.

Common examples:

```text
SSH
HTTP
HTTPS
Database connections
```

TCP connection establishment:

```text
Client                  Server

SYN -------------------->

    <---------------- SYN-ACK

ACK -------------------->

Connection established
```

This is commonly called the TCP three-way handshake.

---

## UDP

UDP is connectionless and does not provide TCP-style delivery guarantees.

Common examples include:

```text
DNS
DHCP
Streaming
Monitoring/telemetry protocols
```

Some protocols can use either TCP or UDP depending on the situation.

---

## Ports

Ports identify network services on a host.

Common ports:

```text
22    SSH
25    SMTP
53    DNS
80    HTTP
123   NTP
443   HTTPS
3306  MySQL
5432  PostgreSQL
6379  Redis
8080  Common alternative HTTP/application port
```

SQL Server commonly uses:

```text
1433
```

Oracle commonly uses:

```text
1521
```

Applications can be configured to use different ports.

---

## Socket

A network connection can be described using:

```text
Protocol
Source IP
Source Port
Destination IP
Destination Port
```

Example:

```text
TCP
10.0.1.25:51234
    ↓
10.0.2.10:443
```

---

## DNS

DNS translates names into network information such as IP addresses.

Example:

```text
app.example.com
        ↓
       DNS
        ↓
203.0.113.10
```

Common DNS records:

```text
A       IPv4 address
AAAA    IPv6 address
CNAME   Alias
MX      Mail server
TXT     Text/verification information
NS      Authoritative name server
```

---

## NAT

Network Address Translation modifies IP addressing information as traffic passes through a network device or service.

A common cloud use case:

```text
Private VM
10.0.1.10
    ↓
NAT Gateway
    ↓
Public Internet
```

This allows private resources to initiate outbound Internet connections without assigning each resource a directly reachable public IP.

---

## Firewall

A firewall controls traffic according to rules.

Example:

```text
Source: 10.0.1.0/24
Destination: 10.0.2.10
Protocol: TCP
Port: 443
Action: Allow
```

Troubleshooting connectivity often requires checking both:

```text
Inbound rules
Outbound rules
```

as well as other network controls along the path.

---

## Load Balancer

A load balancer distributes requests across backend systems.

```text
Users
  ↓
Load Balancer
  ↓
 ┌───────────────┐
 ↓       ↓       ↓
App01   App02   App03
```

Load balancers commonly provide:

```text
Traffic distribution
Health checks
TLS termination
High availability
Routing
```

---

## HTTP and HTTPS

HTTP:

```text
Client
  ↓
TCP connection
  ↓
HTTP request
  ↓
Server
  ↓
HTTP response
```

HTTPS adds TLS:

```text
Client
  ↓
TCP
  ↓
TLS handshake
  ↓
Encrypted HTTP
  ↓
Server
```

Common HTTP status codes:

```text
200  OK
201  Created
301  Permanent Redirect
302  Temporary Redirect
400  Bad Request
401  Unauthorized
403  Forbidden
404  Not Found
429  Too Many Requests
500  Internal Server Error
502  Bad Gateway
503  Service Unavailable
504  Gateway Timeout
```

These codes help identify which layer may be failing.