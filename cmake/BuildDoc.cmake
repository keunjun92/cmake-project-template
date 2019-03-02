function(BuildDoxygen DOXY_IN)
    set(ARGUMENTS DEST_DIR INPUT_ROOT_DIR EXCLUDE_PATTERNS_DIR COMMON_IMG_PATH)
    cmake_parse_arguments(DOXY "" "${ARGUMENTS}" "" ${ARGN})

    find_package(Doxygen)
    if(DOXYGEN_FOUND)
        set(DOXY_DOC_DEST_DIR               ${DOXY_DEST_DIR})
        set(DOXY_DOC_INPUT_ROOT_DIRS        ${DOXY_INPUT_ROOT_DIR})
        set(DOXY_DOC_EXCLUDE_PATTERNS_DIRS  ${DOXY_EXCLUDE_PATTERNS_DIR})
        set(DOXY_DOC_COMMON_IMG_PATH        ${DOXY_COMMON_IMG_PATH})

        configure_file(${DOXY_IN} Doxyfile @ONLY)
        
        add_custom_target(doc
                COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
                WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                COMMENT "Generating API documentation with Doxygen"
                VERBATIM)
    else(DOXYGEN_FOUND)
        message(STATUS "Doxygen need to be installed.")
    endif(DOXYGEN_FOUND)
endfunction()
