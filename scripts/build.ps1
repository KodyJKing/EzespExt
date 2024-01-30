& "./scripts/vendor/premake/premake5.exe" "vs2022"
& "MSBuild.exe" "Ezesp.sln" "/t:Build" "/p:Configuration=Debug"
