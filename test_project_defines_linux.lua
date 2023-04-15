function CreateBinaryAndIntermediateOutputDirectory(is_binary, configuration, platform)
	if is_binary then
		targetdir ("bin/" .. configuration .. "_" .. platform .. "/%{prj.name}")
	else
		objdir ("intermediate/" .. configuration .. "_" .. platform .. "/%{prj.name}")
	end		
end

function LinkLibraryForPlatformAndConfig(platform, config, library, library_path)
	print("[".. platform .."][".. config.."]Linking Library: \"" .. library .. "\" at " .. library_path)

	filter {"platforms:".. platform, "configurations:" .. config}
		libdirs{"libs", library_path}
		links{
			library
		}

	filter{}
end

-----------------------------------------------------------
-- Linux defines
-----------------------------------------------------------
filter "platforms:Unix"
	system "linux"

	filter "Debug"
		optimize "Off"
		symbols "On"
		defines{
			"__STDC_FORMAT_MACROS",
			"_ITERATOR_DEBUG_LEVEL=2",
			"_CRT_SECURE_NO_WARNINGS",
			"_CRT_SECURE_NO_DEPRECATE",
		}
		CreateBinaryAndIntermediateOutputDirectory(true, "Debug", "Linux")
		CreateBinaryAndIntermediateOutputDirectory(false, "Debug", "Linux")

	filter "Release"
		optimize "Full"
		symbols "On"
		defines{
			"__STDC_FORMAT_MACROS",
			"_ITERATOR_DEBUG_LEVEL=0",
			"_CRT_SECURE_NO_WARNINGS",
			"_CRT_SECURE_NO_DEPRECATE",
		}

		CreateBinaryAndIntermediateOutputDirectory(true, "Release", "Linux")
		CreateBinaryAndIntermediateOutputDirectory(false, "Release", "Linux")

	filter "Distr"
		optimize "Full"
		symbols "Off"
		defines{
			"__STDC_FORMAT_MACROS",
			"_ITERATOR_DEBUG_LEVEL=0",
			"_CRT_SECURE_NO_WARNINGS",
			"_CRT_SECURE_NO_DEPRECATE",
		}
		CreateBinaryAndIntermediateOutputDirectory(true, "Distr", "Linux")
		CreateBinaryAndIntermediateOutputDirectory(false, "Distr", "Linux")



