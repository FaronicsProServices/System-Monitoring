# This script retrieves specific system event logs and saves them to a file on a network share.
# Specify the network share path and output file name
$networkSharePath = "UNC PATH"
$outputFileName = "WindowsLogs.txt"

# Combine the network share path and output file name
$outputFilePath = Join-Path $networkSharePath $outputFileName

try {
    # Get events from the System log with specific Event IDs
    $events = Get-WinEvent -LogName System -FilterXPath @"
        <QueryList>
            <Query Id="0" Path="System">
                <Select Path="System">
                    *[System[(EventID=1074 or EventID=1076 or EventID=6006 or EventID=6008 or EventID=6005 or EventID=41) and TimeCreated[timediff(@SystemTime) &lt;= 604800000]]]
                </Select>
            </Query>
        </QueryList>
"@ 

    # Save the results to the specified text file on the network share
    $events | Format-Table -AutoSize | Out-File -FilePath $outputFilePath -Force

    # Display the results in the console
    $events | Format-Table -AutoSize

    Write-Host "Results saved to $outputFilePath"
} catch {
    Write-Host "Error: $_"
}
