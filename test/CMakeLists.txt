add_executable(simple_app simple_app.cc)
target_link_libraries(simple_app ${WEBRTC_LIBRARY_DIRS}/libwebrtc.a ${LIBS})