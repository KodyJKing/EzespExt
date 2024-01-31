local Workspace = "PremakeTemplate"
local Project = "PremakeTemplate"

-- Output a ps1 file defining Workspace and Project
local ps1 = io.open("scripts/project.ps1", "w")
ps1:write("$Workspace = \"" .. Workspace .. "\"\n")
ps1:write("$Project = \"" .. Project .. "\"\n")
ps1:close()

workspace(Workspace)
    configurations { "Debug", "Release" }

project(Project)
    kind "ConsoleApp"
    language "C++"
    targetdir "bin/%{cfg.buildcfg}"

    files { "src/**.h", "src/**.cpp" }

    includedirs { "src" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
