project "catch2"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	flags { "MultiProcessorCompile" }

	files { "src/**.cpp", "src/**.hpp" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
