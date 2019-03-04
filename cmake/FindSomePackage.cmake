# Find Some Pacakge library
# Author: Keunjun
# Date: 2019-02-26

# SomePacakge_INCLUDE_DIR
# SomePacakge_LIBRARY

find_path(SomePacakge_ROOT_DIR
        NAMES include/some_package
)

find_path(SomePacakge_INCLUDE_DIR
        NAMES some_package/core.hpp
        HINTS ${SOEM_ROOT_DIR} include
)

find_library(SomePacakge_LIBRARY
        NAMES some_package
        HINTS ${SomePacakge_ROOT_DIR} ${SomePacakge_LIBRARY_PATH} lib)

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SomePacakge REQUIRED_VARS
        SomePacakge_INCLUDE_DIR
        SomePacakge_LIBRARY
)

if(SomePackage_FOUND)
    get_filename_component(SomePacakge_LIBRARY_PATH ${SomePacakge_LIBRARY} DIRECTORY)
endif()

mark_as_advanced(
        SomePacakge_ROOT_DIR
        SomePacakge_INCLUDE_DIR
        SomePacakge_LIBRARY
        SomePacakge_LIBRARY_PATH
)
