# PowerShell for DevOps & SRE

Practical PowerShell commands and scripts for Windows administration, automation, and troubleshooting.

## Topics

- System information
- Files and directories
- Services
- Processes
- CPU and memory
- Disk usage
- Windows Event Logs
- Networking and ports
- DNS
- HTTP testing
- Environment variables
- PowerShell remoting
- Windows troubleshooting
- Automation scripts

## Structure

```text
03-powershell/
├── README.md
├── commands.md
├── troubleshooting.md
└── scripts/
    ├── system-health-check.ps1
    ├── service-check.ps1
    ├── disk-usage-check.ps1
    └── port-check.ps1
```

## Run a Script

```powershell
.\script.ps1
```

Check execution policy:

```powershell
Get-ExecutionPolicy
```

View all execution policies:

```powershell
Get-ExecutionPolicy -List
```

## Get Help

```powershell
Get-Help Get-Service
Get-Help Get-Service -Examples
Get-Command
```