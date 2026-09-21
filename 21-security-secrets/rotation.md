# Credential Rotation

Credentials should be rotated when:

- They expire
- They are exposed
- An employee/service no longer needs them
- Policy requires rotation
- Suspicious activity occurs

## Exposure Response

Secret Detected
      |
      v
Revoke / Rotate
      |
      v
Determine Exposure
      |
      v
Update Applications
      |
      v
Review Logs
      |
      v
Remove From Git History If Required
      |
      v
Document Incident

Rotation is more important than simply deleting the leaked text.
