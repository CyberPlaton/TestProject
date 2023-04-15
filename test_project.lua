----------------------------------------------
-- Test
----------------------------------------------
project "Test"
print("\n")
print("Defining Project \"Test\"")
location "TestProject"
kind "ConsoleApp"
language "C++"
architecture "x86_64"
cppdialect "C++17"
systemversion "latest"
staticruntime "Off"

filter "action:vs*"
    buildoptions{
        "/Zc:__cplusplus"
    }
filter{}

    files{
        "%{prj.location}/src/Main.h",
        "%{prj.location}/src/Main.cpp",
        "%{prj.location}/src/olcPixelGameEngine.h",
        "%{prj.location}/src/stb_image.h",
    }

    includedirs{
        "%{prj.location}",
    }


    if os.target() == "linux" then
        group "Linking"
            include "test_project_linker_linux.lua"
        group ""
        
        group "Defines"
            include "test_project_defines_linux.lua"
        group ""
    elseif os.target() == "windows" then
        group "Linking"
            include "test_project_linker_windows.lua"
        group ""
        
        group "Defines"
            include "test_project_defines_windows.lua"
        group ""
    end