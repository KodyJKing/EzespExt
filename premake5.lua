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

-- Include all premake projects in the vendor directory
group "vendor"
    local vendorProjects = os.matchdirs("vendor/*")
    for i, project in ipairs(vendorProjects) do
        -- Check that the project has a premake5.lua file
        if os.isfile(project .. "/premake5.lua") then
            print("\27[95mIncluding vendor project: " .. project .. "\27[0m\n")
            include (project)
        end
    end
group ""

-- Include all projects in the projects directory
local projects = os.matchdirs("projects/*")
for i, project in ipairs(projects) do
    print("\27[34mIncluding project: " .. project .. "\27[0m\n")
    include (project)
end
