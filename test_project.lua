----------------------------------------------
-- Mint library
----------------------------------------------
project "Test"
print("\n")
print("Defining Project \"Test\"")
location "TestProject"
kind "ConsoleApp"
language "C++"
architecture "x86_64"
cppdialect "C++17"
-- use latest available system version (e.g. latest Windows SDK)
systemversion "latest"
staticruntime "Off"

filter "action:vs*"
    buildoptions{
        "/Zc:__cplusplus"
    }

    files{
        "Main.h",
        "Main.cpp",
    }

group "Defines"
    include "test_project_defines.lua"
group ""