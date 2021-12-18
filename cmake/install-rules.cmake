if(PROJECT_IS_TOP_LEVEL)
  set(CMAKE_INSTALL_INCLUDEDIR include/cpptest CACHE PATH "")
endif()

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# find_package(<package>) call for consumers to find this project
set(package cpptest)

install(
    TARGETS cpptest_exe
    EXPORT cpptestTargets
    RUNTIME COMPONENT cpptest_Runtime
)

write_basic_package_version_file(
    "${package}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)

# Allow package maintainers to freely override the path for the configs
set(
    cpptest_INSTALL_CMAKEDIR "${CMAKE_INSTALL_DATADIR}/${package}"
    CACHE PATH "CMake package config location relative to the install prefix"
)
mark_as_advanced(cpptest_INSTALL_CMAKEDIR)

install(
    FILES cmake/install-config.cmake
    DESTINATION "${cpptest_INSTALL_CMAKEDIR}"
    RENAME "${package}Config.cmake"
    COMPONENT cpptest_Development
)

install(
    FILES "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
    DESTINATION "${cpptest_INSTALL_CMAKEDIR}"
    COMPONENT cpptest_Development
)

install(
    EXPORT cpptestTargets
    NAMESPACE cpptest::
    DESTINATION "${cpptest_INSTALL_CMAKEDIR}"
    COMPONENT cpptest_Development
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
