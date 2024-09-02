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

& "./scripts/vendor/premake/premake5.exe" $ide
