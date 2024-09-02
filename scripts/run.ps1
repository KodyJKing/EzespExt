param(
    [string]$Config = "Debug",
    [string]$Platform = "Win64"
)

# Get most recent .vcxproj file under /build
$project = Get-ChildItem -Path build -Filter *.vcxproj | Sort-Object LastWriteTime -Descending | Select-Object -First 1

# Print the project
Write-Host "Running $project with Configuration=$Config and Platform=$Platform"

# Remove the .vcxproj extension
$project = $project.Name -replace ".vcxproj", ""

# Run the project
& "build/bin/$Platform/$Config/$project.exe" | Out-Default
