cmake_minimum_required(VERSION 2.8)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)

set(ENV{PKG_CONFIG_PATH} "${CMAKE_SOURCE_DIR}/lib/pkgconfig")

find_package(WEBRTC REQUIRED)
# message(STATUS ${WEBRTC_FOUND})
# message(STATUS ${WEBRTC_INCLUDE_DIRS})
# message(STATUS ${WEBRTC_LIBRARY_DIRS})

include_directories(${WEBRTC_INCLUDE_DIRS})
link_libraries(${WEBRTC_LIBRARY_DIRS})

add_definitions(-DWEBRTC_POSIX -DWEBRTC_MAC)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g")

add_subdirectory(test)