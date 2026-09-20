# Bash Examples

Reusable Bash patterns for DevOps and SRE automation.

## Variables

```bash
ENVIRONMENT="production"
SERVER="web01"

echo "Server: $SERVER"
echo "Environment: $ENVIRONMENT"
```

## Command Substitution

Store command output:

```bash
HOSTNAME=$(hostname)
CURRENT_DATE=$(date)

echo "$HOSTNAME"
echo "$CURRENT_DATE"
```

## Script Arguments

```bash
#!/bin/bash

SERVER=$1
PORT=$2

echo "Checking $SERVER on port $PORT"
```

Run:

```bash
./script.sh web01 443
```

---

## Validate Required Arguments

```bash
if [ $# -lt 2 ]; then
    echo "Usage: $0 <server> <port>"
    exit 1
fi
```

---

## Check Whether a File Exists

```bash
FILE="/etc/nginx/nginx.conf"

if [ -f "$FILE" ]; then
    echo "File exists"
else
    echo "File not found"
fi
```

## Check Whether a Directory Exists

```bash
DIRECTORY="/var/log"

if [ -d "$DIRECTORY" ]; then
    echo "Directory exists"
fi
```

---

## Check Command Success

```bash
curl -I https://example.com

if [ $? -eq 0 ]; then
    echo "Command succeeded"
else
    echo "Command failed"
fi
```

A cleaner pattern is:

```bash
if curl -I https://example.com; then
    echo "Request succeeded"
else
    echo "Request failed"
fi
```

---

## Loop Through Servers

```bash
SERVERS=("web01" "web02" "web03")

for SERVER in "${SERVERS[@]}"
do
    echo "Checking $SERVER"
done
```

---

## Read a File Line by Line

```bash
while IFS= read -r LINE
do
    echo "$LINE"
done < servers.txt
```

---

## Function

```bash
check_service() {

    SERVICE=$1

    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE is running"
    else
        echo "$SERVICE is down"
    fi
}

check_service nginx
```

---

## Check Disk Usage

```bash
THRESHOLD=80

df -P | awk 'NR>1 {print $5, $6}' |
while read -r USAGE FILESYSTEM
do
    USAGE=${USAGE%\%}

    if [ "$USAGE" -ge "$THRESHOLD" ]; then
        echo "WARNING: $FILESYSTEM is ${USAGE}% full"
    fi
done
```

---

## Check HTTP Status

```bash
URL="https://example.com"

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

echo "HTTP Status: $HTTP_CODE"
```

---

## Check Whether a Port Is Listening

```bash
PORT=8080

if ss -lnt | grep -q ":$PORT "; then
    echo "Port $PORT is listening"
else
    echo "Port $PORT is not listening"
fi
```

---

## Search Application Logs

```bash
LOG_FILE="application.log"

grep -inEi "error|failed|critical|exception" "$LOG_FILE"
```

Recent failures only:

```bash
grep -inEi "error|failed|critical|exception" "$LOG_FILE" | tail -20
```

---

## Redirect Output

Write output:

```bash
command > output.log
```

Append:

```bash
command >> output.log
```

Redirect errors:

```bash
command 2> error.log
```

Redirect stdout and stderr:

```bash
command > output.log 2>&1
```

---

## Logging From a Script

```bash
LOG_FILE="/tmp/script.log"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log "Script started"
log "Checking application"
log "Script completed"
```

---

## Exit Codes

Success:

```bash
exit 0
```

Failure:

```bash
exit 1
```

Check previous command:

```bash
echo $?
```

Exit codes are especially important for automation, monitoring, CI/CD, and scheduled jobs.

---

## Cron Example

Run health check every 5 minutes:

```text
*/5 * * * * /home/ubuntu/server-health.sh >> /var/log/server-health.log 2>&1
```

Run backup every day at 2 AM:

```text
0 2 * * * /home/ubuntu/backup.sh /etc/nginx /backup/nginx
```

---

## Safer Script Template

```bash
#!/bin/bash

set -euo pipefail

main() {
    echo "Starting script"

    # automation here

    echo "Completed successfully"
}

main "$@"
```

`set -euo pipefail` is useful for many automation scripts, but should be used deliberately when you understand how failures should be handled.