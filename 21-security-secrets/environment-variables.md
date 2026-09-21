# Environment Variables

Environment variables are commonly used to inject runtime configuration.

Example:

export DB_HOST=db.internal
export DB_USER=application

Application:

DB_HOST = environment variable
DB_USER = environment variable

## Important

Environment variables are better than hard-coding secrets, but they are not automatically secure.

Consider:

- Process access
- CI/CD logs
- Debug output
- Shell history
- Container configuration
- Access permissions

Avoid printing secrets to logs.
