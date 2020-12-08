-- Defined this before calling our projects
workspace "Engine"
	language "C++"
	startproject "launcher"
    configurations { "Debug", "Release" }

include( "game/game.lua" ) -- The main game dll
include( "ref_gl/ref_gl.lua" ) -- The OpenGL rendering pipeline
include( "win32/launcher.lua" ) -- The main launcher, responsible of loading our dlls