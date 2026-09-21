# Security Event Investigation

When users report blocked requests, investigate the security event before changing rules.

## Useful Fields

- Timestamp
- Client IP
- Country
- Host
- URI
- HTTP method
- User agent
- Security rule
- Action
- Request ID / trace information

## 403 Investigation

403 Forbidden
      |
Check security events
      |
Identify matching rule
      |
Review request
      |
Malicious?
 /       \
Yes       No
 |         |
Block    Investigate
         false positive
             |
        Narrow exception

Avoid disabling an entire WAF ruleset because of one legitimate request.
