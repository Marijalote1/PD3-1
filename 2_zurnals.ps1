$errors = Get-EventLog -LogName System -EntryType Error -After (Get-Date).AddDays(-7) 
$file = "$env:USERPROFILE\Documents\errors.txt" 

if ($errors.Count -gt 10) { 
    "KRITISKI! Sistēma ir nestabila!" | Out-File $file 

} else { 
    "OK! Kļūdu līmenis normāls." | Out-File $file 
} 

$errors | ForEach-Object { 
    "$($_.TimeGenerated) - $($_.Message)" 
} | Out-File $file -Append 
