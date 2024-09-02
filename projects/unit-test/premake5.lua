project "unit-test"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    flags { "MultiProcessorCompile" }

    files { "src/**.h", "src/**.cpp" }
    includedirs { 
        "src", 
        "../../vendor/catch2/src",
        "../mylib/src"
    }
    links { "catch2", "mylib" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"