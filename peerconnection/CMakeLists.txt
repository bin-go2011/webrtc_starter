add_executable(peerconnection_client client.cpp)
target_link_libraries(peerconnection_client ${WEBRTC_LIBRARY_DIRS}/libwebrtc.a ${LIBS})