# Delete /bin and /obj folders.
Get-ChildItem -Path . -Include bin,obj -Recurse | Remove-Item -Recurse -Force
# Delete .sln and .vcxproj files.
Get-ChildItem -Path . -Include *.sln,*.vcxproj -Recurse | Remove-Item -Force
