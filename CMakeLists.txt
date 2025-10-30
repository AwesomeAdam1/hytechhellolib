cmake_minimum_required(VERSION 3.16)
project(hellolib VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

add_library(hellolib src/hellolib.cpp)
target_include_directories(hellolib PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
                                        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

add_library(hellolib::hellolib ALIAS hellolib)

install(TARGETS hellolib
        EXPORT hellolibTargets
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

install(EXPORT hellolibTargets
        NAMESPACE hellolib::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/hellolib)

write_basic_package_version_file(
  ${CMAKE_CURRENT_BINARY_DIR}/hellolibConfigVersion.cmake
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY SameMajorVersion
)

configure_package_config_file(
  ${CMAKE_CURRENT_LIST_DIR}/hellolibConfig.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/hellolibConfig.cmake
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/hellolib
)

install(FILES
  ${CMAKE_CURRENT_BINARY_DIR}/hellolibConfig.cmake
  ${CMAKE_CURRENT_BINARY_DIR}/hellolibConfigVersion.cmake
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/hellolib)


