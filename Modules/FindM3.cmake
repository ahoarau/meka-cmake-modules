
# deduce the libraries suffix from the options
set(FIND_M3_LIB_SUFFIX "")

# find the M3 include directory
find_path(M3_ROOT m3
	PATH_SUFFIXES include
		PATHS
		/usr/local/
		/usr
	)

#set(M3_ROOT ${M3_ROOT}/m3/)
#message("!!!M3 ROOT IS ${M3_ROOT}")

# find the requested modules
set(M3_FOUND TRUE) # will be set to false if one of the required modules is not found
set(FIND_M3_LIB_PATHS
		/usr/local
		/usr)

foreach(FIND_M3_COMPONENT ${M3_FIND_COMPONENTS})
    string(TOLOWER ${FIND_M3_COMPONENT} FIND_M3_COMPONENT_LOWER)
    set(FIND_M3_COMPONENT_NAME m3${FIND_M3_COMPONENT_LOWER}${FIND_M3_LIB_SUFFIX})
	foreach(M3ROOT ${M3_SRC})
    		set(M3_INCLUDE_DIR ${M3_INCLUDE_DIR} ${M3ROOT}/m3/${FIND_M3_COMPONENT_LOWER})
	endforeach()
    set(M3_INCLUDE_DIR ${M3_INCLUDE_DIR} ${M3_ROOT}/m3/${FIND_M3_COMPONENT_LOWER})
    find_library(M3_${FIND_M3_COMPONENT} NAMES ${FIND_M3_COMPONENT_NAME} PATHS ${FIND_M3_LIB_PATHS} PATH_SUFFIXES lib)
    set(M3_LIBRARIES ${M3_LIBRARIES} ${M3_${FIND_M3_COMPONENT}})
endforeach()
set(M3_INCLUDE_DIRS ${M3_INCLUDE_DIR})
message("-- m3 libraries: ${M3_LIBRARIES}")
message("-- m3 include dirs: ${M3_INCLUDE_DIRS}")




