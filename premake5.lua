workspace "Ezesp"
    configurations { "Debug", "Release" }

project "Ezesp"
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
