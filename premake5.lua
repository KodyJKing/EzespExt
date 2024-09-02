Defs = {
    workspace = "PremakeTemplate",
    project = "PremakeTemplate"
}

-- Output definitions to a PowerShell script
local defsScript = io.open("scripts/definitions.ps1", "w")
if defsScript == nil then
    print("Failed to open definitions script")
    os.exit(1)
end
for k, v in pairs(Defs) do
    local def = "$" .. k .. " = \"" .. v .. "\""
    print(def)
    defsScript:write(def .. "\n")
end
defsScript:close()

workspace(Defs.workspace)
    location "build"
    configurations { "Debug", "Release" }
    platforms { "Win32", "Win64" }

    filter "platforms:Win32"
        system "Windows"
        architecture "x86"

    filter "platforms:Win64"
        system "Windows"
        architecture "x86_64"

project(Defs.project)
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    flags { "MultiProcessorCompile" }

    files { "src/**.h", "src/**.cpp" }

    includedirs { "src" }

    pchsource "src/pch.cpp"
    forceincludes "pch.h"
    pchheader "pch.h"

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

