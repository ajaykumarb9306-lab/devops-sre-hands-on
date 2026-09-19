# Python for DevOps & SRE

Practical Python examples and automation for infrastructure, cloud, monitoring, APIs, and Site Reliability Engineering.

## Topics

- Variables and data types
- Lists and dictionaries
- Conditions and loops
- Functions
- Command-line arguments
- Files
- JSON
- YAML
- Environment variables
- REST APIs
- HTTP requests
- subprocess
- Exception handling
- Logging
- System monitoring
- DevOps automation

## Structure

```text
06-python/
├── README.md
├── basics.md
├── devops-patterns.md
├── requirements.txt
└── scripts/
    ├── system-health.py
    ├── url-health-check.py
    ├── log-analyzer.py
    ├── json-parser.py
    └── api-request.py
```

## Check Python

```bash
python3 --version
```

## Run a Script

```bash
python3 script.py
```

## Virtual Environment

Create:

```bash
python3 -m venv .venv
```

Activate on Linux/macOS:

```bash
source .venv/bin/activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Deactivate:

```bash
deactivate
```