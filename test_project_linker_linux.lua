-----------------------------------------------------------
-- Linux linking
-----------------------------------------------------------
filter "platforms:Linux"
	links{
		"GL", "X11", "pthread", "png"
	}
filter {"platforms:Linux","configurations:Debug"}
	libdirs{"libs", "%{prj.location}/common/lib/Debug"}
	links{
	}


filter {"platforms:Linux","configurations:Release"}
	libdirs{"libs", "%{prj.location}/common/lib/Release"}
	links{
	}


filter {"platforms:Linux","configurations:Distr"}
	libdirs{"libs", "%{prj.location}/common/lib/Distr"}
	links{
	}