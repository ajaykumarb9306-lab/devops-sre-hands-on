Write-Host "======================================"
Write-Host "WINDOWS SYSTEM HEALTH CHECK"
Write-Host "======================================"

Write-Host "`nHostname:"
hostname

Write-Host "`nUptime:"
$os = Get-CimInstance Win32_OperatingSystem
(Get-Date) - $os.LastBootUpTime

Write-Host "`nDisk:"
Get-Volume |
Where-Object DriveLetter |
Select-Object DriveLetter, FileSystemLabel, Size, SizeRemaining

Write-Host "`nTop CPU Processes:"
Get-Process |
Sort-Object CPU -Descending |
Select-Object -First 5 Name, Id, CPU

Write-Host "`nTop Memory Processes:"
Get-Process |
Sort-Object WorkingSet64 -Descending |
Select-Object -First 5 Name, Id,
    @{Name="MemoryMB";Expression={[math]::Round($_.WorkingSet64 / 1MB,2)}}

Write-Host "`nListening Ports:"
Get-NetTCPConnection -State Listen |
Select-Object LocalAddress, LocalPort, OwningProcess

Write-Host "`nRecent System Errors:"
Get-WinEvent -FilterHashtable @{
    LogName='System'
    Level=2
    StartTime=(Get-Date).AddHours(-1)
} -ErrorAction SilentlyContinue |
Select-Object -First 10 TimeCreated, Id, ProviderName, Message

Write-Host "`n======================================"
Write-Host "Health check completed: $(Get-Date)"
Write-Host "======================================"