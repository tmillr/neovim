if(USE_EXISTING_SRC_DIR)
  unset(LIBVTERM_URL)
endif()
ExternalProject_Add(libvterm
  URL ${LIBVTERM_URL}
  URL_HASH SHA256=${LIBVTERM_SHA256}
  DOWNLOAD_NO_PROGRESS TRUE
  DOWNLOAD_DIR ${DEPS_DOWNLOAD_DIR}/libvterm
  PATCH_COMMAND ${CMAKE_COMMAND} -E copy
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/LibvtermCMakeLists.txt
    ${DEPS_BUILD_DIR}/src/libvterm/CMakeLists.txt
  CMAKE_ARGS ${DEPS_CMAKE_ARGS}
  CMAKE_CACHE_ARGS ${DEPS_CMAKE_CACHE_ARGS})
