-----------------------------------------------------------
-- Windows linking
-----------------------------------------------------------
filter {"platforms:Windows","configurations:Debug"}
	libdirs{"libs", "%{prj.location}/common/lib/Debug"}
	links{
		"gdi32", 
		"kernel32",
		"psapi",
	}


filter {"platforms:Windows","configurations:Release"}
	libdirs{"libs", "%{prj.location}/common/lib/Release"}
	links{
		"gdi32", 
		"kernel32",
		"psapi",
	}


filter {"platforms:Windows","configurations:Distr"}
	libdirs{"libs", "%{prj.location}/common/lib/Distr"}
	links{
		"gdi32", 
		"kernel32",
		"psapi",
	}