param(
    [string]$Config = "Debug",
    [string]$Platform = "Win64"
)

. build/definitions.ps1
& "build/bin/$Platform/$Config/$project.exe" | Out-Default
