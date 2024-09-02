project "library-1"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    flags { "MultiProcessorCompile" }

    files { "src/**.h", "src/**.cpp" }

    includedirs { "src", "src/library-1" }

    pchsource "src/library-1/pch.cpp"
    forceincludes "pch.h"
    pchheader "pch.h"

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
