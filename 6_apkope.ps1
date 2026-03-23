$log = "$env:USERPROFILE\Documents\apkope.log" 
$time = Get-Date 
$disk = Get-PSDrive C 
$freeBefore = $disk.Free 
$freePercent = ($disk.Free / ($disk.Used + $disk.Free)) * 100 
if ($freePercent -lt 25) { 
    Remove-Item "$env:TEMP\*" -Recurse -force -ErrorAction Silentlycontinue

    $diskAfter = Get-PSDrive C 
    $freeAfter = $diskAfter.Free 
    $freeGB = [math]::Round(($freeAfter - $freeBefore) / 1GB, 2) 
    "$time Tīrīšana veikta. Atbrīvoti $freeGB GB." | Out-File $log -Append 
} else { 
    "$time Vieta pietiekama." | Out-File $log -Append 
} 
