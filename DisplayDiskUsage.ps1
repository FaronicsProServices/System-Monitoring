# Generate disk usage report and save it to a file
Get-PSDrive -PSProvider FileSystem | Select-Object Name, Used, Free | Out-File "C:\DiskUsage.txt"
Write-Host "Disk usage report generated at C:\DiskUsage.txt"

# Display the contents of the disk usage report on the console
Get-Content "C:\DiskUsage.txt"
