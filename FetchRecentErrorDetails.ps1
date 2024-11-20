# Retrieves and displays recent error events (Level 2) from the 'System' and 'Application' logs, starting from today's date. 
# The events are sorted by their creation time in descending order and shown in a table format, displaying the time, level, provider, event ID, and message.
$events = Get-WinEvent -FilterHashtable @{ 
    LogName = 'System','Application' 
    Level = 2                    
    StartTime = (Get-Date).Date 
}  | Sort-Object TimeCreated -Descending  
if ($events) { 
    $events | Select-Object TimeCreated, LevelDisplayName, ProviderName, ID, Message | Format-Table -AutoSize 
} else { 
    Write-Host "No recent errors found." 
} 
