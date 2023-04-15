-----------------------------------------------------------
-- Linux linking
-----------------------------------------------------------
filter {"platforms:Unix","configurations:Debug"}
	libdirs{"libs", "%{prj.location}/common/lib/Debug"}
	links{
		"X11", 
		"GL",
		"pthread",
        "png",
	}


filter {"platforms:Unix","configurations:Release"}
	libdirs{"libs", "%{prj.location}/common/lib/Release"}
	links{
		"X11", 
		"GL",
		"pthread",
        "png",
	}


filter {"platforms:Unix","configurations:Distr"}
	libdirs{"libs", "%{prj.location}/common/lib/Distr"}
	links{
		"X11", 
		"GL",
		"pthread",
        "png",
	}