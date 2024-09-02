project "console-app-2"
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
