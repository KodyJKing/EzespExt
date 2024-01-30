param(
    [string]$watchPath = "C:\path\to\watch",
    [string]$command = "C:\path\to\command.exe"
)

# Define global copy of command
$global:command = $command

Write-Host "Watching $watchPath for changes"

# Run the command on startup
Invoke-Expression -Command $command

try {
    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = $watchPath
    $watcher.IncludeSubdirectories = $true
    $watcher.EnableRaisingEvents = $true

    $action = {
        $path = $Event.SourceEventArgs.FullPath
        $changeType = $Event.SourceEventArgs.ChangeType
        Write-Host "File $path $changeType"

        Invoke-Expression -Command $global:command | Out-String -Stream | ForEach-Object { Write-Host $_ }
    }

    Register-ObjectEvent -InputObject $watcher -EventName "Created" -Action $action
    Register-ObjectEvent -InputObject $watcher -EventName "Changed" -Action $action
    Register-ObjectEvent -InputObject $watcher -EventName "Deleted" -Action $action
    Register-ObjectEvent -InputObject $watcher -EventName "Renamed" -Action $action

    # See https://powershell.one/tricks/filesystem/filesystemwatcher#implementation
    do {
        # Wait-Event waits for a second and stays responsive to events
        # Start-Sleep in contrast would NOT work and ignore incoming events
        Wait-Event -Timeout 1
    } while ($true)
} finally {
    # Clean up the watcher
    Write-Host "Watch stopped."
    $watcher.Dispose()
}
