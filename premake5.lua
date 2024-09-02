workspace "premake-template"
    location "build"
    configurations { "Debug", "Release" }
    platforms { "Win32", "Win64" }

    filter "platforms:Win32"
        system "Windows"
        architecture "x86"

    filter "platforms:Win64"
        system "Windows"
        architecture "x86_64"

-- Include all projects in the projects directory
local projects = os.matchdirs("projects/*")
for i, project in ipairs(projects) do
    print("\27[95mIncluding project: " .. project .. "\27[0m\n")
    include (project)
end
