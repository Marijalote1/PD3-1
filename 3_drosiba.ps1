$status = Get-MpComputerStatus 
$realTime = $status.RealTimeProtectionEnabled 
$lastScan = $status.QuickScanEndTime 

if (-not $realTime -or $lastScan -lt (Get-Date).AddDays(-3)) { 
    Write-Output "Sistēma ir apdraudēta!" 
} else { 
    Write-Output "Sistēma ir droša." 
} 
Write-Output "RealTimeProtection: $realTime" 
Write-Output "Pēdējais skenējums: $lastScan" 
