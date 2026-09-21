# Network and DNS Troubleshooting

## DNS

dig example.com

dig +short example.com

nslookup example.com

## Connectivity

ping HOSTNAME

curl -v http://HOSTNAME

nc -vz HOSTNAME PORT

## Routing

traceroute HOSTNAME

## Ports

ss -lntp

macOS:

lsof -i :PORT

## Flow

Application Unreachable
       |
DNS resolves?
   /       \
 No         Yes
 |           |
DNS issue   Port reachable?
             /      \
           No        Yes
           |          |
       Network      HTTP/App
       Firewall     investigation
