param (
    [Parameter(Mandatory=$true)]
    [string]$ComputerName,

    [Parameter(Mandatory=$true)]
    [int]$Port
)

$result = Test-NetConnection `
    -ComputerName $ComputerName `
    -Port $Port `
    -WarningAction SilentlyContinue

if ($result.TcpTestSucceeded) {
    Write-Host "OK: $ComputerName port $Port is reachable."
    exit 0
}
else {
    Write-Host "CRITICAL: $ComputerName port $Port is NOT reachable."
    exit 1
}