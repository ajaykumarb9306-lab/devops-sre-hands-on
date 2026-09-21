# Web Application Firewall

A WAF operates at the HTTP/HTTPS application layer.

## Request Flow

Client Request
      |
      v
     WAF
      |
      +---- Block
      |
      +---- Challenge
      |
      +---- Allow
      |
      v
Application

## Common Rule Categories

### Managed Rules

Rules maintained by the WAF provider to protect against common vulnerabilities.

### Custom Rules

Organization-specific policies.

Examples:

- Block suspicious IP addresses
- Restrict administrative paths
- Block unwanted countries
- Restrict HTTP methods
- Match suspicious URI patterns

## SQL Injection

Example suspicious request:

/products?id=1' OR '1'='1

A WAF may detect patterns associated with SQL injection.

## Cross-Site Scripting

Example suspicious input:

<script>alert(1)</script>

A WAF may detect common XSS patterns.

## False Positives

A legitimate request can sometimes match a security rule.

Before changing a rule:

1. Identify the matched rule.
2. Review the request.
3. Confirm whether traffic is legitimate.
4. Determine the narrowest exception.
5. Avoid disabling broad protection unnecessarily.
6. Document the change.
