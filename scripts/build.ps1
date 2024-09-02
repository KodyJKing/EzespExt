param(
    [string]$Config = "Debug",
    [string]$Platform = "Win64"
)

# Generate project files
& "./scripts/vendor/premake/premake5.exe" "vs2022"

# Get most recent .sln file under /build
$workspace = Get-ChildItem -Path build -Filter *.sln | Sort-Object LastWriteTime -Descending | Select-Object -First 1

# Print the workspace
Write-Host "Building $workspace with Configuration=$Config and Platform=$Platform"

# Build the workspace
& "MSBuild.exe" "build/$workspace" "/t:Build" "/p:Configuration=$Config" "/p:Platform=$Platform"
