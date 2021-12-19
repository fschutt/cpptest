cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    cpptest
    VERSION 0.1.0
    DESCRIPTION "This is a short description"
    HOMEPAGE_URL "https://azul.rs"
    LANGUAGES CXX
)

docs_early_return()

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    cpptest_lib OBJECT
    source/lib.cpp
)

add_library(azul SHARED IMPORTED)
set_target_properties(
  azul PROPERTIES
  IMPORTED_LOCATION "${AZUL_LINK_PATH}/azul.dll"
  IMPORTED_IMPLIB "${AZUL_LINK_PATH}/azul.dll.lib"
  INTERFACE_INCLUDE_DIRECTORIES "${PROJECT_SOURCE_DIR}/thirdparty/azul>"
)

target_include_directories(
    cpptest_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(cpptest_lib PUBLIC cxx_std_17)

# ---- Declare executable ----

add_executable(cpptest_exe source/main.cpp)
add_executable(cpptest::exe ALIAS cpptest_exe)

set_target_properties(
    cpptest_exe PROPERTIES
    OUTPUT_NAME cpptest
    EXPORT_NAME exe
)

target_compile_features(cpptest_exe PRIVATE cxx_std_17)
target_link_libraries(cpptest_exe PRIVATE azul)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT cpptest_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of cpptest"
  )
endif()

include(cmake/dev-mode.cmake)
