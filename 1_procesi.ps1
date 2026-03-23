$procesi = Get-Process | Where-Object { $_.ProcessName -ne "svchost" } | 
    Sort-Object WorkingSet64 -Descending | 
    Select-Object -First 5 
$kopējaisRAM = 0 

foreach ($p in $procesi) { 
    $ramMB = [math]::Round($p.WorkingSet64 / 1MB, 2) 
    Write-Output "$($p.ProcessName) - $ramMB MB" 
    $kopējaisRAM += $ramMB 
} 

Write-Output "Top 5 procesu total RAM: $kopējaisRAM MB" 
