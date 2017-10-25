cmake_minimum_required(VERSION 2.8)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)

set(ENV{PKG_CONFIG_PATH} "${CMAKE_SOURCE_DIR}/pkgconfig")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

find_package(WEBRTC REQUIRED)

message(STATUS "  WEBRTC_INCLUDE_DIRS: " )
message(STATUS ${WEBRTC_INCLUDE_DIRS})
message(STATUS "  WEBRTC_LIBRARY_DIRS: " )
message(STATUS ${WEBRTC_LIBRARY_DIRS})

include_directories(${WEBRTC_INCLUDE_DIRS})

if(APPLE)
    add_definitions(-DWEBRTC_POSIX -DWEBRTC_MAC)
    set(LIBS "-framework Cocoa"
             "-framework Foundation"
             "-framework IOKit"
             "-framework Security"
             "-framework SystemConfiguration"
             "-framework ApplicationServices"
             "-framework CoreServices"
             "-framework CoreVideo"
             "-framework CoreAudio"
             "-framework AudioToolbox"
             "-framework QTKit"
             "-framework AVFoundation"
             "-framework CoreMedia"
    )
endif(APPLE)


add_subdirectory(test)