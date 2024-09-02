param(
    [string]$Config = "Debug",
    [string]$Platform = "Win64"
)

& "./scripts/watch.ps1" "." "./scripts/build.ps1 $Config $Platform"
