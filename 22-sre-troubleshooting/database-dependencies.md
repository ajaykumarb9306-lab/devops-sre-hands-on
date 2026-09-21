# Database and Dependency Troubleshooting

Applications often depend on:

- Databases
- APIs
- Message queues
- Caches
- Authentication systems
- External services

## Investigation

Application Error
      |
      v
Check application logs
      |
      v
Identify dependency
      |
      v
Check DNS/network
      |
      v
Check dependency health
      |
      v
Check latency/errors
      |
      v
Check credentials/configuration

## Database Symptoms

- Connection timeout
- Connection pool exhaustion
- Authentication failure
- Slow queries
- Locking
- High CPU
- Storage saturation

Do not assume an application error means the application itself is the root cause.
