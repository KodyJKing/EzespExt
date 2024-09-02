param(
    [string]$Config = "Debug",
    [string]$Platform = "Win64"
)

. scripts/definitions.ps1
& "build/bin/$Platform/$Config/$project.exe" | Out-Default
