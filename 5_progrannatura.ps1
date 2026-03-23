$updates = winget upgrade --accept-source-agreements
$list = $updates | Select-Object -Skip 2 | Where-Object { $_ -match "\w" }
$count = $list.Count
Write-Output "Sistēmā ir [$count] programmas, kuras nepieciešamas atjaunināt."
$list | ForEach-Object { Write-Output $_ }
