# Python DevOps Patterns

Useful Python patterns for infrastructure and SRE automation.

## JSON

```python
import json

with open("config.json") as file:
    data = json.load(file)

print(data)
```

Access:

```python
print(data["environment"])
```

Write JSON:

```python
with open("output.json", "w") as file:
    json.dump(data, file, indent=4)
```

---

## YAML

Install:

```bash
pip install PyYAML
```

Read YAML:

```python
import yaml

with open("config.yaml") as file:
    data = yaml.safe_load(file)

print(data)
```

YAML is heavily used by tools such as:

```text
Kubernetes
Ansible
CI/CD systems
Configuration files
```

---

## HTTP Requests

Install:

```bash
pip install requests
```

Example:

```python
import requests

response = requests.get(
    "https://example.com",
    timeout=10
)

print(response.status_code)
```

Check:

```python
if response.ok:
    print("Application is healthy")
else:
    print("Application returned an error")
```

---

## REST API

```python
import requests

url = "https://api.example.com/resources"

response = requests.get(url, timeout=10)

response.raise_for_status()

data = response.json()

print(data)
```

---

## API Authentication

Use environment variables:

```python
import os
import requests

token = os.getenv("API_TOKEN")

headers = {
    "Authorization": f"Bearer {token}"
}

response = requests.get(
    "https://api.example.com/resources",
    headers=headers,
    timeout=10
)
```

Do not hardcode tokens in Git repositories.

---

## Run System Commands

```python
import subprocess

result = subprocess.run(
    ["hostname"],
    capture_output=True,
    text=True
)

print(result.stdout)
```

Check exit code:

```python
print(result.returncode)
```

Raise exception when command fails:

```python
subprocess.run(
    ["systemctl", "status", "nginx"],
    check=True
)
```

Prefer argument lists rather than `shell=True` when possible.

---

## Logging

```python
import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(message)s"
)

logging.info("Health check started")
logging.warning("Disk usage is high")
logging.error("Application unavailable")
```

Logging is generally preferable to filling automation scripts with `print()` statements.

---

## Useful Script Structure

```python
#!/usr/bin/env python3

import logging
import sys


def main():
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s %(levelname)s %(message)s"
    )

    logging.info("Script started")

    # automation logic

    logging.info("Script completed")

    return 0


if __name__ == "__main__":
    sys.exit(main())
```