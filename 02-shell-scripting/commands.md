# Bash Quick Reference

## Shebang

```bash
#!/bin/bash
```

## Variables

```bash
NAME="Ajay"
ENVIRONMENT="production"

echo "$NAME"
echo "Environment: $ENVIRONMENT"
```

## Command Substitution

```bash
HOSTNAME=$(hostname)
DATE=$(date)

echo "$HOSTNAME"
echo "$DATE"
```

## User Input

```bash
read -p "Enter server name: " SERVER

echo "Server: $SERVER"
```

## Command-Line Arguments

```bash
echo "Script: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Number of arguments: $#"
echo "All arguments: $@"
```

Run:

```bash
./script.sh nginx production
```

## Exit Codes

```bash
echo $?
```

Convention:

```text
0     Success
Non-0 Failure/Error
```

Example:

```bash
if command; then
    echo "Success"
else
    echo "Failed"
    exit 1
fi
```

## Conditions

```bash
if [ "$ENVIRONMENT" = "production" ]; then
    echo "Production environment"
else
    echo "Non-production environment"
fi
```

Numeric comparison:

```bash
if [ "$CPU" -gt 80 ]; then
    echo "High CPU"
fi
```

Useful operators:

```text
-eq   equal
-ne   not equal
-gt   greater than
-lt   less than
-ge   greater than or equal
-le   less than or equal
```

Files:

```bash
[ -f file.txt ]    # File exists
[ -d directory ]   # Directory exists
[ -r file.txt ]    # Readable
[ -w file.txt ]    # Writable
[ -x script.sh ]   # Executable
```

## Loops

For loop:

```bash
for SERVER in web01 web02 web03
do
    echo "Checking $SERVER"
done
```

While loop:

```bash
COUNT=1

while [ "$COUNT" -le 5 ]
do
    echo "$COUNT"
    ((COUNT++))
done
```

## Functions

```bash
check_service() {
    SERVICE=$1

    systemctl is-active --quiet "$SERVICE"
}
```

Call:

```bash
check_service nginx
```

Function with output:

```bash
get_hostname() {
    hostname
}

SERVER=$(get_hostname)
```

## Arrays

```bash
SERVERS=("web01" "web02" "db01")

for SERVER in "${SERVERS[@]}"
do
    echo "$SERVER"
done
```

## Pipes

```bash
ps aux | grep nginx
```

```bash
cat application.log | grep ERROR
```

Prefer this when `cat` isn't needed:

```bash
grep ERROR application.log
```

## Output Redirection

Overwrite:

```bash
command > output.txt
```

Append:

```bash
command >> output.txt
```

Errors:

```bash
command 2> errors.txt
```

Standard output and errors:

```bash
command > output.txt 2>&1
```

## grep

```bash
grep "ERROR" app.log
grep -i "error" app.log
grep -n "ERROR" app.log
grep -c "ERROR" app.log
grep -r "ERROR" /var/log/
```

Multiple patterns:

```bash
grep -Ei "error|failed|critical" app.log
```

## awk

Print column:

```bash
awk '{print $1}' file.txt
```

Disk usage example:

```bash
df -h | awk '{print $5, $6}'
```

## sed

Replace text:

```bash
sed 's/development/production/g' config.txt
```

Edit file:

```bash
sed -i 's/development/production/g' config.txt
```

> `sed -i` behavior differs slightly between GNU/Linux and macOS.

## Cron

Edit cron:

```bash
crontab -e
```

View:

```bash
crontab -l
```

Example — every 5 minutes:

```text
*/5 * * * * /home/ubuntu/scripts/health-check.sh
```

## Safer Bash Scripts

Useful starting options:

```bash
set -euo pipefail
```

- `-e` exits when an unhandled command fails.
- `-u` treats unset variables as errors.
- `pipefail` catches failures inside pipelines.

Use these deliberately because some scripts need custom error handling.