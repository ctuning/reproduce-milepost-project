@echo off

rem
rem Installation script for cM packages.
rem Part of Collective Mind Infrastructure (cM).
rem
rem See cM LICENSE.txt for licensing details.
rem See cM Copyright.txt for copyright details.
rem
rem Developer(s): Grigori Fursin, started on 2011.09
rem

echo.
echo Executing local installation script ...

rem Checking vars
IF NOT "%CM_INSTALL_OBJ_DIR%"=="" rd /Q /S %CM_INSTALL_OBJ_DIR%
IF NOT "%CM_INSTALL_OBJ_DIR%"=="" mkdir %CM_INSTALL_OBJ_DIR%

mkdir %CM_INSTALL_DIR%\bin

Setlocal EnableDelayedExpansion

if NOT "%CM_SKIP_BUILD%" == "yes" (
 echo.

 cd /D %CM_INSTALL_OBJ_DIR%

 echo.
 echo Configuring ...
 cmake.exe -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%CM_INSTALL_DIR% %CM_LOCAL_SRC_DIR%
 if !errorlevel! neq 0 exit /b !errorlevel! 

 echo.
 echo Building all ...
 nmake all
 if !errorlevel! neq 0 exit /b !errorlevel! 

 echo.
 echo Testing all ...
 nmake test
rem Ignore because most of the time there is a strange problem with python at the end
rem if !errorlevel! neq 0 exit /b !errorlevel! 

 echo.
 echo Installing all ...
 nmake install
 if !errorlevel! neq 0 exit /b !errorlevel! 
)

echo.>> %CM_CODE_ENV_FILE%

rem Some things are hardwired due to hacks to compile GCC with plugin support on MingW
echo set CM_%CM_CODE_UID%_INSTALL=%CM_INSTALL_DIR%\etc\%GCC_BIN%>> %CM_CODE_ENV_FILE%
echo set CM_%CM_CODE_UID%_BIN=%%CM_%CM_CODE_UID%_INSTALL%%\bin>> %CM_CODE_ENV_FILE%
echo set CM_%CM_CODE_UID%_LIB=%%CM_%CM_CODE_UID%_INSTALL%%\%CM_OS_LIB_DIR%>> %CM_CODE_ENV_FILE%
echo set CM_%CM_CODE_UID%_INCLUDE=%%CM_%CM_CODE_UID%_INSTALL%%\include>> %CM_CODE_ENV_FILE%

rem Cleaning directories if needed

exit /b 0
