param (
    [int]$Threshold = 80
)

Get-Volume |
Where-Object { $_.DriveLetter -and $_.Size -gt 0 } |
ForEach-Object {

    $UsedPercent = [math]::Round(
        (($_.Size - $_.SizeRemaining) / $_.Size) * 100,
        2
    )

    if ($UsedPercent -ge $Threshold) {
        Write-Host "WARNING: Drive $($_.DriveLetter): is $UsedPercent% full"
    }
    else {
        Write-Host "OK: Drive $($_.DriveLetter): is $UsedPercent% full"
    }
}