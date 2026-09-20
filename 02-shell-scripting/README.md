# Shell Scripting for DevOps & SRE

Practical Bash scripting examples and automation used in Linux, DevOps, and SRE environments.

## Topics

- Variables
- User input
- Command-line arguments
- Exit codes
- Conditions
- Loops
- Functions
- Arrays
- Pipes and redirection
- grep, awk, sed
- Error handling
- Process and service automation
- Log processing
- Health checks
- Backups
- HTTP endpoint monitoring
- Cron automation

## Structure

```text
02-shell-scripting/
├── README.md
├── commands.md
├── examples.md
└── scripts/
    ├── server-health.sh
    ├── service-monitor.sh
    ├── log-analyzer.sh
    ├── backup.sh
    └── url-health-check.sh
```

## Run a Script

Make it executable:

```bash
chmod +x script.sh
```

Run:

```bash
./script.sh
```

Or:

```bash
bash script.sh
```

## Debug a Script

```bash
bash -x script.sh
```

Check syntax without executing:

```bash
bash -n script.sh
```