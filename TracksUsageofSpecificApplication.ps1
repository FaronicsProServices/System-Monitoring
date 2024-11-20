# Specify the application name 
$appName = "AppName"  
$Processlist = Get-Process 
# Get the process for the specified application 
$process = $Processlist | Where-Object { $_.ProcessName -Like $appName } 
# Check if the process exists 
if ($process) { 
    # Get the memory usage in MB 
    $memoryUsageMB = [math]::Round($process.WorkingSet / 1MB, 2) 
    # Get the application usage time 
    $usageTime = (Get-Date) - $process.StartTime 
    # Display application name, memory usage, and usage time 
    Write-Host "Application Name: $($process.ProcessName)" 
    Write-Host "Memory Usage: $memoryUsageMB MB" 
    Write-Host "Usage Time: $($usageTime.Hours) hours, $($usageTime.Minutes) minutes, $($usageTime.Seconds) seconds"
} else { 
    Write-Host "Application '$appName' is not running." 
}
