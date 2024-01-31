& "./scripts/vendor/premake/premake5.exe" "vs2022"
. scripts/project.ps1
& "MSBuild.exe" "$Workspace.sln" "/t:Build" "/p:Configuration=Debug"
