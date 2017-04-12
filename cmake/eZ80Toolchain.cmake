set(CMAKE_SYSTEM_NAME eZ80)

set(CMAKE_C_COMPILER  ez80cc)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_LIST_DIR})

#
# Find the eZ80 toolchain from a CEdev directory.
#
function(find_ez80_path_cedev)
	message(STATUS "Searching through CEdev directories...")
	if(UNIX)
		file(GLOB EZ80_PATH_HINTS ~/CEdev*)
	elseif(WIN32)
		set(EZ80_PATH_HINTS
			"C:\\CEdev"
			"C:\\Program Files (x86)\\CEdev"
			"C:\\Programs\\CEdev"
			"$ENV{SystemDrive}\\CEdev"
			"$ENV{SystemDrive}\\Program Files (x86)\\CEdev"
			"$ENV{SystemDrive}\\Programs\\CEdev"
			)
	endif()
	find_path(EZ80_PATH
		HINTS ${EZ80_PATH_HINTS}
		PATH_SUFFIXES bin
		DOC "Path for eZ80 toolchain (found inside CEdev)")
endfunction()

#
# Find the eZ80 toolchain from a ZiLOG Developer Suite directory.
#
function(find_ez80_path_zds)
	message(STATUS "Searching through ZDS directories...")
	file(GLOB EZ80_PATH_HINTS
		"C:\\Program Files (x86)\\ZiLOG\\*"
		"C:\\Program Files\\ZiLOG\\*"
		"$ENV{SystemDrive}\\Program Files (x86)\\ZiLOG\\*"
		"$ENV{SystemDrive}\\Program Files\\ZiLOG\\*"
		)
	find_path(EZ80_PATH
		HINTS ${EZ80_PATH_HINTS}
		PATH_SUFFIXES bin
		DOC "Path for eZ80 toolchain (found inside ZDSII)")
endfunction()

#
# Find the eZ80 toolchain from all known locations.
#
function(FIND_EZ80_PATH)
	message(STATUS "Looking for eZ80 toolchain...")

	if(NOT EZ80_PATH)
		find_ez80_path_cedev()
	endif()

	if(NOT EZ80_PATH)
		find_ez80_path_zds()
	endif()

	if(EZ80_PATH)
		message(STATUS "Found eZ80 toolchain: ${EZ80_PATH}")
	else()
		message(FATAL_ERROR "Couldn't find eZ80 toolchain! Try setting EZ80_PATH yourself.")
endif()

# 
# required_variables(MSG msg VARS var1 var2 ... varN)
#
# Enforce variables required in a function. (Adapted from Arduino CMake)
#
function(required_variables)
	cmake_parse_arguments(INPUT "" "MSG" "VARS" ${ARGN})
	error_for_unparsed(INPUT)
	foreach(VAR ${INPUT_ARGS})
		if("${${VAR}}" STREQUAL "")
			message(FATAL_ERROR "${VAR} not set: ${INPUT_MSG}")
		endif()
	endforeach()
endfunction()