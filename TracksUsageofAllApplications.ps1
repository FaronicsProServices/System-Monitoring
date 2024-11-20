# Retrieves and tracks all running applications in Windows, displaying their name, main window title, memory usage in MB, and uptime since the process started.
Get-Process | 
    Select-Object Name, MainWindowTitle, 
        @{Name="MemoryUsage(MB)"; Expression={$_.WorkingSet / 1MB -as [int]}},
        @{Name="UsageTime"; Expression={ 
            $uptime = [DateTime]::Now - $_.StartTime 
            "{0}d {1}hours {2}m {3}s" -f $uptime.Days, $uptime.Hours, $uptime.Minutes, $uptime.Seconds 
        }} 
