-- The main launcher, responsible of loading our dlls
-- TODO: Figure out if i need more stuffs added it
project "launcher"
	kind "WindowedApp"
	characterset "MBCS"
    language "C"

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
		"*.c",
		"*.ico",
		"*.rc",
		"../server/*.c",
		"../server/*.h",
		"../client/*.c",
		"../client/*.h",
		"../qcommon/*.c",
		"../qcommon/*.h",
		"../ref_gl/gl_rmain.c",
		"../game/m_flash.c",
		"../game/q_shared.c",
		"../game/game.h",
		"../game/q_shared.h"
	}

	vpaths {
	   ["Header Files"] =  { "*.h", "../server/*.h", "../client/*.h", "../qcommon/*.h", "../game/q_shared.h", "../game/game.h" },
	   ["Source Files"] =  { "*.c", "../server/*.c", "../client/*.c", "../qcommon/*.c", "../game/q_shared.c", "../game/m_flash.c", "../ref_gl/gl_rmain.c", },
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