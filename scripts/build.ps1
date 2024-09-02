param(
    [string]$Config = "Debug",
    [string]$Platform = "Win64",
    [string]$IDE = $null
)

# # Generate project files
& "./scripts/premake.ps1 $IDE"

# Get most recent .sln file under /build
$workspace = Get-ChildItem -Path build -Filter *.sln | Sort-Object LastWriteTime -Descending | Select-Object -First 1

# Print the workspace
Write-Host "Building $workspace with Configuration=$Config and Platform=$Platform and IDE=$IDE" -ForegroundColor Yellow

# Build the workspace
& "MSBuild.exe" "build/$workspace" "/t:Build" "/p:Configuration=$Config" "/p:Platform=$Platform"
