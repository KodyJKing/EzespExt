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

local function isIncludable(path)
    if string.find(path, "~") then return false end
    return os.isfile(path .. "/premake5.lua")
end

group "vendor"
    for i, project in ipairs(os.matchdirs("vendor/*")) do
        if isIncludable(project) then
            print("\27[95mIncluding: " .. project .. "\27[0m")
            include (project)
        end
    end
group ""

for i, project in ipairs(os.matchdirs("projects/*")) do
    if isIncludable(project) then
        print("\27[34mIncluding: " .. project .. "\27[0m")
        include (project)
    end
end
