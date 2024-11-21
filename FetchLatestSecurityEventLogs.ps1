# This PowerShell command retrieves the most recent 10 security-related event logs from the Windows Event Viewer, sorts them by the creation time, and displays them in a detailed list format.
Get-WinEvent -LogName Security | Sort-Object TimeCreated –Descending | Select-Object –First 10 | Format-List 
