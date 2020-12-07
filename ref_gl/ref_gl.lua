-- The OpenGL rendering pipeline
-- TODO: Figure out if i need more stuffs added it
project "ref_gl"
	kind "SharedLib"
	characterset "MBCS"
    language "C"

	targetdir ( "../build" )	-- Put our generated dll here
	targetname ( "ref_gl" )
	
	-- incompatible types
	-- not all control paths return a value
	disablewarnings { "4133", "4715" }
	
	links { "opengl32", "winmm" }

	-- This is used by the launcher
	defines { "WIN32", "_WINDOWS", "_USRDLL", "REF_GL_EXPORTS" }

	files {
		"*.h", 
		"*.c",
		"../game/q_shared.c",
		"../win32/glw_imp.c",
		"../win32/qgl_win.c",
		"../win32/q_shwin.c",
		"../client/qmenu.h", 
		"../client/ref.h", 
		"../game/q_shared.h", 
		"../qcommon/qcommon.h", 
		"../qcommon/qfiles.h",
		"ref_gl.def"
	}

	vpaths {
	   ["Header Files"] =  { "*.h", "../client/qmenu.h", "../client/ref.h", "../game/q_shared.h", "../qcommon/qcommon.h", "../qcommon/qfiles.h" },
	   ["Source Files"] =  { "*.c", "../game/q_shared.c", "../win32/glw_imp.c", "../win32/qgl_win.c", "../win32/q_shwin.c" },
	   ["Resource Files"] = "ref_gl.def"	-- This is requiered by the engine to properly load the ref_gl dll
	}

    filter { "configurations:Debug" }
        defines { "_DEBUG" }
		disablewarnings { "4996" } -- Function call with parameters that may be unsafe
        symbols "On"
        optimize "Off"
		linkoptions { "/DEF:ref_gl.def" } -- HACK: We had to define this here
	
    filter { "configurations:Release" }
        defines { "NDEBUG" }
        optimize "Speed"
		buildoptions { "/Gy" }