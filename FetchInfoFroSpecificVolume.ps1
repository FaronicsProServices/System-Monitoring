# Define parameter, enter the letter for the drive to fetch information about that specific drive
param ( 
    [char[]]$DriveLetter = 'C' 
) 

# Get information about volume with specified drive letter 
$volumeInfo = Get-Volume -DriveLetter $DriveLetter 

# Output volume information line by line 
$volumeInfo | ForEach-Object { 
    $sizeGB = [math]::Round(($_.Size / 1GB), 2) 
    $sizeRemainingGB = [math]::Round(($_.SizeRemaining / 1GB), 2) 
    $sizeUsedGB = $sizeGB - $sizeRemainingGB 
  
    Write-Output "DriveLetter: $($_.DriveLetter)" 
    Write-Output "FriendlyName: $($_.FriendlyName)" 
    Write-Output "FileSystemType: $($_.FileSystemType)" 
    Write-Output "DriveType: $($_.DriveType)" 
    Write-Output "HealthStatus: $($_.HealthStatus)" 
    Write-Output "OperationalStatus: $($_.OperationalStatus)" 
    Write-Output "SizeRemaining: $sizeRemainingGB GB" 
    Write-Output "SizeUsed: $sizeUsedGB GB" 
    Write-Output "Size: $sizeGB GB" 
}
