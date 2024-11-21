# Fetches latest 5 event logs
#The number of events can be increased and decreased by specifying the number for the parameter: “-Newest”
Get-EventLog -LogName System -Newest 5
