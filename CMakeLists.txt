cmake_minimum_required(VERSION 3.5)
project(bundang C CXX)

set(CMAKE_CXX_STANDARD 14)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH};${PROJECT_SOURCE_DIR}/cmake)

set(BUILD_EXAMPLE ON CACHE BOOL "Build examples")
set(BUILD_DOC ON CACHE BOOL "Build documentation")

find_package(SomePackage QUIET)
if(SomePackage_FOUND)
else()
  message(STATUS "[SomePackage] Cannot find a package.")
endif()

include_directories(include)
add_subdirectory(src)
if(BUILD_EXAMPLE)
  add_subdirectory(example)
endif()
if(BUILD_DOC)
  include(BuildDoc)

  BuildDoxygen(${CMAKE_CURRENT_SOURCE_DIR}/doxygen/Doxyfile.in
    DEST_DIR              ${CMAKE_BINARY_DIR}
    INPUT_ROOT_DIR        ${CMAKE_HOME_DIRECTORY}
    EXCLUDE_PATTERNS_DIR  ${CMAKE_BINARY_DIR}
  )
endif()

configure_file(${PROJECT_SOURCE_DIR}/cmake/${PROJECT_NAME}-config.cmake.in ${PROJECT_BINARY_DIR}/${PROJECT_NAME}-config.cmake @ONLY)
install(FILES ${PROJECT_BINARY_DIR}/${PROJECT_NAME}-config.cmake DESTINATION lib/bundang)
