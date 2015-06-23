:: Embed version number in header file
:: Build All HelloWorld Projects

@echo off

SET versionFilePath=".\HelloWorldCpp\app\version_number.h"
SET git="C:\Program Files (x86)\Git\bin\git.exe"

:: Capture the hash of the head into variable
FOR /F "tokens=* USEBACKQ" %%F IN (`%git% rev-parse HEAD`) DO (
SET gitHash=%%F
)

:: Write version number header file
echo #ifndef THOR_VERSION_NUMBER_H > %versionFilePath%
echo #define THOR_VERSION_NUMBER_H >> %versionFilePath%
echo. >> %versionFilePath%
echo // Do Not Edit >> %versionFilePath%
echo const char *GITHASH_STRING     = "%gitHash%"; >> %versionFilePath%
echo const char *VERSION_STRING     = "%BUILD_TAG%"; >> %versionFilePath%
echo.  >> %versionFilePath%
echo #endif // THOR_VERSION_NUMBER_H >> %versionFilePath%

:: Run Cmake to generate the project files
cd HelloWorldCpp
mkdir build
cd build
cmake .. -G "Visual Studio 12 2013"

:: Build the solution
call "%VS120COMNTOOLS%\vsvars32.bat"
call cmake --build .

if %ERRORLEVEL% GEQ 1 EXIT /B 1

:: Tag GIT repo with Jenkins build number
%git% tag -a %BUILD_TAG% -m "Jenkins Triggered Build"
::%git% push origin %BUILD_TAG%
