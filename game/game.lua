-- The main game dll
-- TODO: Figure out if i need more stuffs added it
project "game"
	kind "SharedLib"
	characterset "MBCS"
    language "C++"

	targetdir ( "../build/game" )	-- Put our generated dll here
	targetname ( "gamex86" )
	
	-- uninitialized local variable
	disablewarnings { "4700" }

	-- This is used by the launcher
	defines { "WIN32", "_WINDOWS", "_USRDLL", "GAME_EXPORTS" }

	files {
		"*.h", 
		"*.cpp", 
		"game.def" 
	}

	vpaths {
	   ["Header Files"] = "*.h",
	   ["Source Files"] = "*.cpp",
	   ["Resource Files"] = "game.def"	-- This is requiered by the engine to properly load the game dll
	}

    filter { "configurations:Debug" }
        defines { "_DEBUG" }
		disablewarnings { "4996" } -- Function call with parameters that may be unsafe
        symbols "On"
        optimize "Off"
		linkoptions { "/DEF:game.def" } -- HACK HACK: We had to define this here
	
    filter { "configurations:Release" }
        defines { "NDEBUG" }
        optimize "Speed"