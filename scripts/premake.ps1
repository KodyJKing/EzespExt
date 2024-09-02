param(
    [string]$IDE = $null
)

. ./config.ps1

$ide = $IDE

if (-not $ide) {
    if ($Config_IDE) {
        $ide = $Config_IDE
    } else {
        $ide = 'vs2022'
    }
}

Write-Host ""
Write-Host ""
Write-Host "Generating project files for $ide" -ForegroundColor Yellow
& "./scripts/vendor/premake/premake5.exe" $ide
