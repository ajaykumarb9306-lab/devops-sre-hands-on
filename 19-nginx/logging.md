# Nginx Logging

Two important Nginx logs are:

## Access Log

Records HTTP requests.

Typical location:

/var/log/nginx/access.log

Useful for:

- Status codes
- Client IPs
- Requested URLs
- Traffic analysis
- Incident investigation

Example:

tail -f /var/log/nginx/access.log

## Error Log

Records Nginx errors and operational problems.

Typical location:

/var/log/nginx/error.log

Example:

tail -f /var/log/nginx/error.log

## Common HTTP Status Codes

200 - Success
301/302 - Redirect
400 - Bad Request
401 - Unauthorized
403 - Forbidden
404 - Not Found
499 - Client closed request
500 - Internal Server Error
502 - Bad Gateway
503 - Service Unavailable
504 - Gateway Timeout

## SRE Investigation

For a 502:

1. Check Nginx error logs.
2. Check backend application health.
3. Check backend port.
4. Check DNS/service discovery.
5. Check network connectivity.
6. Check proxy configuration.
