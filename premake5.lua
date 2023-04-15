workspace "Test"
	print("\n")
	print("Creating Workspace: \"Test\":")
	architecture "x86_64"
	startproject "Test"
	configurations{
		"Debug",		-- Traditional Debugging build
		"Release",		-- Verbose build to be debugged in a "Release" environment
		"Distr"			-- Shipping build
	}
	
	platforms{
		"Windows", "Linux"
	}

	flags{
		"MultiProcessorCompile"
	}

	group "Test"
		include "test_project.lua"
	group ""