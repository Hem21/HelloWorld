:: Build All HelloWorld Projects

@echo off

::echo const char *git     = "$(git rev-parse HEAD)"\; > version.h
echo const char *version = "%BUILD_TAG%"\; >> version.h