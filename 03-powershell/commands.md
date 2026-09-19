# PowerShell Commands Cheat Sheet

Practical PowerShell commands for Windows administration, DevOps, and SRE.

## System Information

```powershell
hostname
Get-ComputerInfo
Get-CimInstance Win32_OperatingSystem
Get-CimInstance Win32_ComputerSystem
```

Current user:

```powershell
whoami
$env:USERNAME
```

Current PowerShell version:

```powershell
$PSVersionTable
```

System uptime:

```powershell
(Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
```

---

## Files and Directories

Current directory:

```powershell
Get-Location
```

List files:

```powershell
Get-ChildItem
```

Include hidden files:

```powershell
Get-ChildItem -Force
```

Change directory:

```powershell
Set-Location C:\Temp
```

Create directory:

```powershell
New-Item -ItemType Directory -Path C:\Temp\App
```

Create file:

```powershell
New-Item -ItemType File -Path C:\Temp\test.txt
```

Copy:

```powershell
Copy-Item test.txt backup.txt
```

Copy directory:

```powershell
Copy-Item C:\Source C:\Backup -Recurse
```

Move:

```powershell
Move-Item test.txt C:\Temp\
```

Remove:

```powershell
Remove-Item test.txt
```

Recursive removal:

```powershell
Remove-Item C:\Temp\App -Recurse
```

Be careful with:

```powershell
Remove-Item C:\Temp\App -Recurse -Force
```

---

## Search Files

Find files:

```powershell
Get-ChildItem C:\Logs -Recurse -Filter *.log
```

Find large files:

```powershell
Get-ChildItem C:\ -File -Recurse -ErrorAction SilentlyContinue |
Sort-Object Length -Descending |
Select-Object -First 20 FullName, Length
```

---

## Read Files

```powershell
Get-Content application.log
```

Last 50 lines:

```powershell
Get-Content application.log -Tail 50
```

Follow log:

```powershell
Get-Content application.log -Wait
```

Search:

```powershell
Select-String -Path application.log -Pattern "ERROR"
```

Multiple patterns:

```powershell
Select-String -Path application.log -Pattern "ERROR","FAILED","EXCEPTION"
```

---

## Services

List services:

```powershell
Get-Service
```

Find service:

```powershell
Get-Service -Name W3SVC
```

Running services:

```powershell
Get-Service | Where-Object Status -eq "Running"
```

Stopped services:

```powershell
Get-Service | Where-Object Status -eq "Stopped"
```

Start:

```powershell
Start-Service W3SVC
```

Stop:

```powershell
Stop-Service W3SVC
```

Restart:

```powershell
Restart-Service W3SVC
```

Detailed service information:

```powershell
Get-CimInstance Win32_Service -Filter "Name='W3SVC'"
```

---

## Processes

List processes:

```powershell
Get-Process
```

Find process:

```powershell
Get-Process nginx -ErrorAction SilentlyContinue
```

Top CPU processes:

```powershell
Get-Process |
Sort-Object CPU -Descending |
Select-Object -First 10
```

Top memory processes:

```powershell
Get-Process |
Sort-Object WorkingSet64 -Descending |
Select-Object -First 10 Name, Id, WorkingSet64
```

Stop process:

```powershell
Stop-Process -Id 1234
```

Force:

```powershell
Stop-Process -Id 1234 -Force
```

---

## Disk

```powershell
Get-Volume
```

Filesystem drives:

```powershell
Get-PSDrive -PSProvider FileSystem
```

Physical disks:

```powershell
Get-Disk
```

Example:

```powershell
Get-Volume |
Select-Object DriveLetter, FileSystemLabel, Size, SizeRemaining
```

---

## CPU and Memory

CPU:

```powershell
Get-CimInstance Win32_Processor
```

Operating system memory:

```powershell
Get-CimInstance Win32_OperatingSystem |
Select-Object TotalVisibleMemorySize, FreePhysicalMemory
```

Performance counter:

```powershell
Get-Counter '\Processor(_Total)\% Processor Time'
```

Available memory:

```powershell
Get-Counter '\Memory\Available MBytes'
```

---

## Networking

IP configuration:

```powershell
Get-NetIPConfiguration
```

IP addresses:

```powershell
Get-NetIPAddress
```

Routes:

```powershell
Get-NetRoute
```

Network adapters:

```powershell
Get-NetAdapter
```

Listening TCP connections:

```powershell
Get-NetTCPConnection -State Listen
```

Check specific port:

```powershell
Get-NetTCPConnection -LocalPort 443 -ErrorAction SilentlyContinue
```

---

## Connectivity

Ping:

```powershell
Test-Connection google.com
```

Test TCP port:

```powershell
Test-NetConnection google.com -Port 443
```

Detailed test:

```powershell
Test-NetConnection google.com -Port 443 -InformationLevel Detailed
```

---

## DNS

Resolve hostname:

```powershell
Resolve-DnsName google.com
```

View DNS configuration:

```powershell
Get-DnsClientServerAddress
```

Clear DNS cache:

```powershell
Clear-DnsClientCache
```

---

## HTTP

Request:

```powershell
Invoke-WebRequest https://example.com
```

Store response:

```powershell
$response = Invoke-WebRequest https://example.com
$response.StatusCode
```

REST APIs:

```powershell
Invoke-RestMethod https://api.example.com
```

---

## Environment Variables

View:

```powershell
Get-ChildItem Env:
```

Specific variable:

```powershell
$env:PATH
```

Set for current session:

```powershell
$env:APP_ENV = "production"
```

---

## Event Logs

Recent System events:

```powershell
Get-WinEvent -LogName System -MaxEvents 50
```

Application events:

```powershell
Get-WinEvent -LogName Application -MaxEvents 50
```

System errors:

```powershell
Get-WinEvent -FilterHashtable @{
    LogName='System'
    Level=2
} -MaxEvents 50
```

Recent events:

```powershell
Get-WinEvent -FilterHashtable @{
    LogName='System'
    StartTime=(Get-Date).AddHours(-1)
}
```

---

## PowerShell Pipeline

```powershell
Get-Service |
Where-Object Status -eq "Running" |
Sort-Object Name
```

Select properties:

```powershell
Get-Process |
Select-Object Name, Id, CPU
```

Export CSV:

```powershell
Get-Service |
Export-Csv services.csv -NoTypeInformation
```

---

## PowerShell Remoting

Test remoting:

```powershell
Test-WSMan server01
```

Interactive session:

```powershell
Enter-PSSession -ComputerName server01
```

Remote command:

```powershell
Invoke-Command -ComputerName server01 -ScriptBlock {
    Get-Service
}
```

Remoting requires appropriate WinRM configuration, authentication, network access, and permissions.

---

## Useful Windows SRE Check

```powershell
Get-ComputerInfo
Get-Volume
Get-Service | Where-Object Status -eq "Stopped"
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
Get-NetIPConfiguration
Get-NetTCPConnection -State Listen
Get-WinEvent -LogName System -MaxEvents 50
```