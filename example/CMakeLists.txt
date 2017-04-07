list(demo_SHARED_LIBS graphx fileioc keypadc)

set(demo_BSSHEAP_LOW D031F6)
set(demo_BSSHEAP_HIGH D13FD6)
set(demo_STACK_HIGH D1A87E)
set(demo_INIT_LOC D1A87F)
set(demo_USE_FLASH_FUNCTIONS)

generate_ez80_executable(demo
	NAME DEMO
	DESCRIPTION "C Demo"
	SRCS src/main.c
	DEBUG
	ARCHIVED
	COMPRESSED
	ICONPNG iconc.png)