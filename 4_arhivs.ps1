$date = Get-Date -Format "yyyy-MM-dd"
$source = "$env:USERPROFILE\Dokuments\errord.txt"
$zip = "$env":USERPROFILE\Dokuments\atskaite_$date.zip"
Compress-Archive -Path $source -destinationPath $zip -force
$size = (Get-item $zip).Length / 1KB
Write-Output"Arhīva izmērs: $ ([math]::Round($size,2)) KB"
