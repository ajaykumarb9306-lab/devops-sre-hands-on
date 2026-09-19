# Windows & PowerShell Troubleshooting Guide

Practical troubleshooting workflows for Windows servers used in DevOps and SRE environments.

## 1. Windows Server Is Slow

Check CPU:

```powershell
Get-Process |
Sort-Object CPU -Descending |
Select-Object -First 10 Name, Id, CPU
```

Check memory:

```powershell
Get-Process |
Sort-Object WorkingSet64 -Descending |
Select-Object -First 10 Name, Id,
@{Name="MemoryMB";Expression={[math]::Round($_.WorkingSet64 / 1MB,2)}}
```

Check available memory:

```powershell
Get-Counter '\Memory\Available MBytes'
```

Check CPU utilization:

```powershell
Get-Counter '\Processor(_Total)\% Processor Time'
```

Check disk:

```powershell
Get-Volume
```

Check recent system errors:

```powershell
Get-WinEvent -FilterHashtable @{
    LogName='System'
    Level=2
    StartTime=(Get-Date).AddHours(-1)
}
```

---

## 2. Windows Service Is Down

Check service:

```powershell
Get-Service -Name W3SVC
```

Detailed information:

```powershell
Get-CimInstance Win32_Service -Filter "Name='W3SVC'"
```

Start:

```powershell
Start-Service W3SVC
```

Restart:

```powershell
Restart-Service W3SVC
```

Check related Event Logs:

```powershell
Get-WinEvent -LogName System -MaxEvents 100 |
Where-Object Message -Match "W3SVC"
```

---

## 3. IIS Website Is Not Responding

Check IIS service:

```powershell
Get-Service W3SVC
```

Check port 80:

```powershell
Get-NetTCPConnection -LocalPort 80 -ErrorAction SilentlyContinue
```

Check port 443:

```powershell
Get-NetTCPConnection -LocalPort 443 -ErrorAction SilentlyContinue
```

Test locally:

```powershell
Invoke-WebRequest http://localhost
```

Check connectivity:

```powershell
Test-NetConnection localhost -Port 80
```

If the WebAdministration module is available:

```powershell
Import-Module WebAdministration
```

Check websites:

```powershell
Get-Website
```

Check application pools:

```powershell
Get-WebAppPoolState *
```

Typical path:

```text
IIS Service
    ↓
Website
    ↓
Application Pool
    ↓
Binding
    ↓
Listening Port
    ↓
Application
    ↓
Network / Load Balancer
```

---

## 4. High CPU

Find CPU-heavy processes:

```powershell
Get-Process |
Sort-Object CPU -Descending |
Select-Object -First 10 Name, Id, CPU
```

Inspect process:

```powershell
Get-Process -Id <PID>
```

Check executable:

```powershell
Get-CimInstance Win32_Process -Filter "ProcessId=<PID>" |
Select-Object ProcessId, Name, ExecutablePath, CommandLine
```

Stop only when appropriate:

```powershell
Stop-Process -Id <PID>
```

Force only when necessary:

```powershell
Stop-Process -Id <PID> -Force
```

---

## 5. High Memory

Check:

```powershell
Get-Process |
Sort-Object WorkingSet64 -Descending |
Select-Object -First 10 Name, Id,
@{Name="MemoryMB";Expression={[math]::Round($_.WorkingSet64 / 1MB,2)}}
```

Check available memory:

```powershell
Get-Counter '\Memory\Available MBytes'
```

System memory information:

```powershell
Get-CimInstance Win32_OperatingSystem |
Select-Object TotalVisibleMemorySize, FreePhysicalMemory
```

---

## 6. Disk Is Full

Check volumes:

```powershell
Get-Volume
```

Check filesystem drives:

```powershell
Get-PSDrive -PSProvider FileSystem
```

Find large files:

```powershell
Get-ChildItem C:\ -File -Recurse -ErrorAction SilentlyContinue |
Sort-Object Length -Descending |
Select-Object -First 20 FullName,
@{Name="SizeGB";Expression={[math]::Round($_.Length / 1GB,2)}}
```

Common locations to investigate:

```text
Application logs
IIS logs
Temporary files
Crash dumps
Installer files
Old backups
Monitoring/agent logs
```

Identify the cause before deleting data.

---

## 7. Port Is Not Listening

Check listening ports:

```powershell
Get-NetTCPConnection -State Listen
```

Specific port:

```powershell
Get-NetTCPConnection -LocalPort 8080 -ErrorAction SilentlyContinue
```

Find owning process:

```powershell
Get-NetTCPConnection -LocalPort 8080 |
Select-Object LocalAddress, LocalPort, OwningProcess
```

Then:

```powershell
Get-Process -Id <PID>
```

---

## 8. Remote Port Cannot Be Reached

Test:

```powershell
Test-NetConnection server01 -Port 443
```

Detailed:

```powershell
Test-NetConnection server01 -Port 443 -InformationLevel Detailed
```

Check:

```text
DNS
↓
Route
↓
Windows Firewall
↓
Network Firewall
↓
Cloud Firewall / Security Group
↓
Server
↓
Listening Port
↓
Application
```

---

## 9. DNS Problems

Resolve:

```powershell
Resolve-DnsName example.com
```

Check configured DNS servers:

```powershell
Get-DnsClientServerAddress
```

Clear local DNS cache:

```powershell
Clear-DnsClientCache
```

Test by hostname:

```powershell
Test-Connection example.com
```

If you know the destination IP, compare hostname and IP connectivity to help isolate DNS from general network problems.

---

## 10. Application Returns HTTP Error

Request:

```powershell
Invoke-WebRequest https://application.example.com
```

Capture response:

```powershell
$response = Invoke-WebRequest https://application.example.com
$response.StatusCode
```

Test TCP first:

```powershell
Test-NetConnection application.example.com -Port 443
```

Troubleshooting path:

```text
DNS resolution
↓
TCP 443 connectivity
↓
TLS
↓
Web Server / IIS
↓
Application Pool
↓
Application
↓
Backend dependencies
```

---

## 11. Windows Event Logs

Recent System events:

```powershell
Get-WinEvent -LogName System -MaxEvents 100
```

Recent Application events:

```powershell
Get-WinEvent -LogName Application -MaxEvents 100
```

Errors:

```powershell
Get-WinEvent -FilterHashtable @{
    LogName='Application'
    Level=2
    StartTime=(Get-Date).AddHours(-1)
}
```

Search message:

```powershell
Get-WinEvent -LogName Application -MaxEvents 500 |
Where-Object Message -Match "error"
```

Useful log areas:

```text
System
Application
Security
IIS
PowerShell
Application-specific logs
```

---

## 12. Server Rebooted Unexpectedly

Check last boot:

```powershell
(Get-CimInstance Win32_OperatingSystem).LastBootUpTime
```

Search relevant System events:

```powershell
Get-WinEvent -FilterHashtable @{
    LogName='System'
    Id=41,1074,6005,6006,6008
} -MaxEvents 50
```

These events can help investigate startup, shutdown, restart, and unexpected shutdown activity.

---

## 13. PowerShell Script Fails

Check PowerShell version:

```powershell
$PSVersionTable
```

Check execution policy:

```powershell
Get-ExecutionPolicy -List
```

Run script:

```powershell
.\script.ps1
```

Check whether command exists:

```powershell
Get-Command <command>
```

Get command help:

```powershell
Get-Help <command> -Examples
```

Inspect error:

```powershell
$Error[0]
```

Detailed error:

```powershell
$Error[0] | Format-List * -Force
```

---

## General Windows SRE Troubleshooting Flow

Start with:

```powershell
hostname

Get-ComputerInfo

Get-Volume

Get-Process |
Sort-Object CPU -Descending |
Select-Object -First 10

Get-Process |
Sort-Object WorkingSet64 -Descending |
Select-Object -First 10

Get-Service

Get-NetIPConfiguration

Get-NetTCPConnection -State Listen

Get-WinEvent -LogName System -MaxEvents 50

Get-WinEvent -LogName Application -MaxEvents 50
```

Then follow:

```text
Server
  ↓
CPU / Memory / Disk
  ↓
Windows Service
  ↓
Process
  ↓
Listening Port
  ↓
IIS / Application
  ↓
Network / Firewall
  ↓
DNS / Load Balancer
  ↓
Backend Dependencies
```