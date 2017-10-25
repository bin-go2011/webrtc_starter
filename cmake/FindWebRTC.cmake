find_package(PkgConfig QUIET)
if (PKG_CONFIG_FOUND)
  pkg_search_module(WEBRTC webrtc)

endif()