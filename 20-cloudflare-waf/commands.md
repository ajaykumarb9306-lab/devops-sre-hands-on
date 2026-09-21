# Useful Commands

## DNS

dig example.com

dig +short example.com

nslookup example.com

## HTTP

curl -I https://example.com

curl -v https://example.com

## TLS

curl -Iv https://example.com

openssl s_client -connect example.com:443 -servername example.com

## Local WAF Lab

docker compose up -d

docker compose ps

docker compose logs waf

docker exec waf-proxy nginx -t

curl -i http://localhost:8081/

curl -i http://localhost:8081/admin

## Stop Lab

docker compose down
