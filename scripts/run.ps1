param(
    [string]$Config = "Debug",
    [string]$Platform = "Win64",
    [string]$Project = $null
)

. scripts/get_project.ps1
$project = Get-Project $Project

# Print the project
Write-Host "Running $project with Configuration=$Config and Platform=$Platform" -ForegroundColor Yellow

# Run the project
& "build/bin/$Platform/$Config/$project.exe" | Out-Default
