@echo off

rem
rem Installation script for CK packages.
rem
rem See CK LICENSE.txt for licensing details.
rem See CK Copyright.txt for copyright details.
rem
rem Developer(s): Grigori Fursin, 2015
rem

set PACKAGE_NAME=ctuning-cc-2.5
set PACKAGE_NAME1=%PACKAGE_NAME%.1-win
set CK_COMPILER_FLAGS_CC_OPTS=-O2

rem 
echo.
echo Copying package files ...

cd /D %INSTALL_DIR%
cp -f %PACKAGE_DIR%/%PACKAGE_NAME1%.tar.bz2 .
bzip2 -d %PACKAGE_NAME1%.tar.bz2
tar xvf %PACKAGE_NAME1%.tar
del /Q %PACKAGE_NAME1%.tar

rem 
echo.
echo Configuring ...

mkdir bin

rem #############################################################################
echo.
echo Compiling ctuning-cc ...

cd %INSTALL_DIR%\%PACKAGE_NAME%\ccc-framework\src-plat-dep\tools\ctuning-cc
make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% COMPILER=%CK_CC% TARGET=ctuning-cc.exe TARGET1=ctuning-c++.exe TARGET2=ctuning-fortran.exe
make install DEST=%INSTALL_DIR_MINGW% TARGET=ctuning-cc.exe TARGET1=ctuning-c++.exe TARGET2=ctuning-fortran.exe

rem #############################################################################
echo.
echo Compiling ccc-ml-accumulate-features ...

cd %CK_LOCAL_SRC_DIR%\ccc-framework\src-plat-dep\plugins\ml\ccc-ml-accumulate-features
make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% COMPILER=%CK_CC% TARGET=ccc-ml-accumulate-features.exe
make install DEST=%INSTALL_DIR_MINGW% TARGET=ccc-ml-accumulate-features.exe


cp -rf %INSTALL_DIR_MINGW%/%PACKAGE_NAME%/ccc-framework/src-plat-indep %INSTALL_DIR_MINGW%/src-plat-indep

exit /b 0
