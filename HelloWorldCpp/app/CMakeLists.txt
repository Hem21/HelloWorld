# Set Properties->General->Configuration Type to Application(.exe)
# Creates app.exe with the listed sources
# Adds sources to the Solution Explorer
SET(SOURCE
  stdafx.cpp
  HelloWorldCpp.cpp
)

SET(HEADERS
  stdafx.h
  targetver.h
  version_number.h
)

add_executable (HelloWorldCpp ${SOURCE} ${HEADERS})

# Properties->Linker->Input->Additional Dependencies
# target_link_libraries (app math)

# Creates a folder "executables" and adds target 
# project (app.vcproj) under it
set_property(TARGET HelloWorldCpp PROPERTY FOLDER "executables")

# Adds logic to INSTALL.vcproj to copy app.exe to destination directory
install (TARGETS HelloWorldCpp
         RUNTIME DESTINATION ${PROJECT_BINARY_DIR}/bin)