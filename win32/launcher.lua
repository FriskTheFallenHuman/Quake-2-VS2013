-- The main launcher, responsible of loading our dlls
-- TODO: Figure out if i need more stuffs added it
project "launcher"
	kind "WindowedApp"
	characterset "MBCS"
    language "C++"

	targetdir ( "../build" )	-- Put our generated dll here
	targetname ( "launcher" )
	
	-- incompatible types
	-- not all control paths return a value
	-- undefined; assuming extern returning int
	disablewarnings { "4133", "4715", "4013" }
	
	links { "winmm", "wsock32" }

	-- This is used by the launcher
	defines { "WIN32", "_WINDOWS" }

	files {
		"*.h", 
		"*.cpp",
		"*.ico",
		"*.rc",
		"../server/*.cpp",
		"../server/*.h",
		"../client/*.cpp",
		"../client/*.h",
		"../qcommon/*.cpp",
		"../qcommon/*.h",
		"../ref_gl/gl_rmain.cpp",
		"../game/m_flash.cpp",
		"../game/q_shared.cpp",
		"../game/game.h",
		"../game/q_shared.h"
	}

	vpaths {
	   ["Header Files"] =  { "*.h", "../server/*.h", "../client/*.h", "../qcommon/*.h", "../game/q_shared.h", "../game/game.h" },
	   ["Source Files"] =  { "*.cpp", "../server/*.cpp", "../client/*.cpp", "../qcommon/*.cpp", "../game/q_shared.cpp", "../game/m_flash.cpp", "../ref_gl/gl_rmain.cpp", },
	   ["Resource Files"] = { "*.ico", "*.rc" },
	}

    filter { "configurations:Debug" }
        defines { "_DEBUG" }
		disablewarnings { "4996" } -- Function call with parameters that may be unsafe
        symbols "On"
        optimize "Off"
	
    filter { "configurations:Release" }
        defines { "NDEBUG" }
        optimize "Speed"
		buildoptions { "/Gy" }