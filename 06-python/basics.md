# Python Basics for DevOps

## Variables

```python
server = "web01"
port = 443
environment = "production"

print(server)
print(port)
print(environment)
```

## Strings

```python
server = "web01"

print(f"Checking server: {server}")
```

## Lists

```python
servers = ["web01", "web02", "db01"]

for server in servers:
    print(server)
```

## Dictionaries

Very common when working with JSON, APIs, cloud resources, and Kubernetes data.

```python
server = {
    "name": "web01",
    "ip": "10.0.1.10",
    "environment": "production"
}

print(server["name"])
print(server["ip"])
```

## Conditions

```python
cpu = 85

if cpu >= 80:
    print("WARNING: High CPU")
else:
    print("CPU is healthy")
```

## Loops

```python
servers = ["web01", "web02", "web03"]

for server in servers:
    print(f"Checking {server}")
```

## Functions

```python
def check_server(server):
    print(f"Checking {server}")

check_server("web01")
```

Return a value:

```python
def is_healthy(status_code):
    return 200 <= status_code < 300

print(is_healthy(200))
```

## Command-Line Arguments

```python
import sys

print(sys.argv)
```

Example:

```bash
python3 script.py nginx
```

Access first argument:

```python
import sys

service = sys.argv[1]

print(f"Service: {service}")
```

For larger scripts, prefer `argparse`.

## argparse

```python
import argparse

parser = argparse.ArgumentParser()

parser.add_argument("--server", required=True)
parser.add_argument("--port", type=int, required=True)

args = parser.parse_args()

print(args.server)
print(args.port)
```

Run:

```bash
python3 script.py --server web01 --port 443
```

## Read File

```python
with open("application.log", "r") as file:
    content = file.read()

print(content)
```

Read line by line:

```python
with open("application.log", "r") as file:
    for line in file:
        print(line.strip())
```

## Write File

```python
with open("output.txt", "w") as file:
    file.write("Health check completed\n")
```

Append:

```python
with open("output.txt", "a") as file:
    file.write("Another result\n")
```

## Exception Handling

```python
try:
    with open("config.json") as file:
        data = file.read()

except FileNotFoundError:
    print("Configuration file not found")
```

General pattern:

```python
try:
    # operation
    pass

except Exception as error:
    print(f"ERROR: {error}")
```

Catch specific exceptions whenever possible.

## Environment Variables

```python
import os

environment = os.getenv("APP_ENV", "development")

print(environment)
```

Set in Linux/macOS:

```bash
export APP_ENV=production
```

Never hardcode secrets directly into source code.

## Exit Codes

```python
import sys

sys.exit(0)
```

Failure:

```python
sys.exit(1)
```

Exit codes are important for:

```text
CI/CD
Monitoring
Cron jobs
Automation
Containers
Kubernetes health tooling
```