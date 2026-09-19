param (
    [Parameter(Mandatory=$true)]
    [string]$ServiceName
)

$service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

if (-not $service) {
    Write-Host "ERROR: Service '$ServiceName' was not found."
    exit 1
}

if ($service.Status -eq "Running") {
    Write-Host "OK: $ServiceName is running."
    exit 0
}
else {
    Write-Host "CRITICAL: $ServiceName is $($service.Status)."
    exit 1
}