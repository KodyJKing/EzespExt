param(
    [string]$Config = "Debug",
    [string]$Platform = "Win64",
    [string]$Project = $null
)

. scripts/get_project.ps1
$project = Get-Project $Project

& "./scripts/watch.ps1" "." "./scripts/build.ps1 $Config $Platform; ./scripts/run.ps1 $Config $Platform $project"
