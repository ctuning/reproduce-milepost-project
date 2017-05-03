@echo off

rem
rem Installation script for CK packages.
rem
rem See CK LICENSE.txt for licensing details.
rem See CK Copyright.txt for copyright details.
rem
rem Developer(s): Grigori Fursin, 2015
rem

set PACKAGE_NAME=ctuning-cc-2.5-plugins
set ICI2_PLUGIN_VER=gcc-plugin-ici2
set CK_COMPILER_FLAGS_CC_OPTS=-O2

rem
echo.
echo Copying package files ...

cd /D %INSTALL_DIR%
copy /B %PACKAGE_DIR%\%PACKAGE_NAME%-win.tar.bz2 .
bzip2 -d %PACKAGE_NAME%-win.tar.bz2
tar xvf %PACKAGE_NAME%-win.tar
rm %PACKAGE_NAME%-win.tar

rem
echo.
echo Configuring ...

mkdir bin
mkdir lib
mkdir lib\c
mkdir lib\fortran
mkdir lib\cpp

rem #############################################################################
echo.
echo Compiling extract-program-structure MILEPOST\cTuning plugin ...

cd %INSTALL_DIR%\%PACKAGE_NAME%\src\extract-program-structure

make clean ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%CK_ENV_COMPILER_GCC_SRC% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%CK_ENV_COMPILER_GCC_LIB_GCC_PLUGIN_CC%
make install INSTALL_DIR=%INSTALL_DIR_MINGW%/lib/c ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

make clean ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%CK_ENV_COMPILER_GCC_SRC% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%CK_ENV_COMPILER_GCC_LIB_GCC_PLUGIN_FC%
make install INSTALL_DIR=%INSTALL_DIR_MINGW%/lib/fortran ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

make clean ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%                                                                                        
make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%CK_ENV_COMPILER_GCC_SRC% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%CK_ENV_COMPILER_GCC_LIB_GCC_PLUGIN_CPP%
make install INSTALL_DIR=%INSTALL_DIR_MINGW%/lib/cpp ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

rem #############################################################################
echo.
echo Compiling save-executed-passes MILEPOST\cTuning plugin ...

cd %INSTALL_DIR%\%PACKAGE_NAME%\src\save-executed-passes

make clean ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%CK_ENV_COMPILER_GCC_SRC% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%CK_ENV_COMPILER_GCC_LIB_GCC_PLUGIN_CC%
make install INSTALL_DIR=%INSTALL_DIR_MINGW%/lib/c ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

make clean ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%CK_ENV_COMPILER_GCC_SRC% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%CK_ENV_COMPILER_GCC_LIB_GCC_PLUGIN_FC%
make install INSTALL_DIR=%INSTALL_DIR_MINGW%/lib/fortran ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

make clean ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%CK_ENV_COMPILER_GCC_SRC% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%CK_ENV_COMPILER_GCC_LIB_GCC_PLUGIN_CPP%
make install INSTALL_DIR=%INSTALL_DIR_MINGW%/lib/cpp ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%


rem #############################################################################
echo.
echo Compiling substitute-passes MILEPOST\cTuning plugin ...

cd %INSTALL_DIR%\%PACKAGE_NAME%\src\substitute-passes

make clean ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%CK_ENV_COMPILER_GCC_SRC% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%CK_ENV_COMPILER_GCC_LIB_GCC_PLUGIN_CC%
make install INSTALL_DIR=%INSTALL_DIR_MINGW%/lib/c ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

make clean ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%CK_ENV_COMPILER_GCC_SRC% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%CK_ENV_COMPILER_GCC_LIB_GCC_PLUGIN_FC%
make install INSTALL_DIR=%INSTALL_DIR_MINGW%/lib/fortran ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

make clean ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%CK_ENV_COMPILER_GCC_SRC% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%CK_ENV_COMPILER_GCC_LIB_GCC_PLUGIN_CPP%
make install INSTALL_DIR=%INSTALL_DIR_MINGW%/lib/cpp ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%


rem #############################################################################
echo.
echo Compiling extract-program-static-features MILEPOST\cTuning plugin ...

cd %INSTALL_DIR%\%PACKAGE_NAME%\src\extract-program-static-features

make clean ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%CK_ENV_COMPILER_GCC_SRC% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%CK_ENV_COMPILER_GCC_LIB_GCC_PLUGIN_CC%
make install INSTALL_DIR=%INSTALL_DIR_MINGW%/lib/c ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

make clean ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%CK_ENV_COMPILER_GCC_SRC% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%CK_ENV_COMPILER_GCC_LIB_GCC_PLUGIN_FC%
make install INSTALL_DIR=%INSTALL_DIR_MINGW%/lib/fortran ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

make clean ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%CK_ENV_COMPILER_GCC_SRC% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%CK_ENV_COMPILER_GCC_LIB_GCC_PLUGIN_CPP%
make install INSTALL_DIR=%INSTALL_DIR_MINGW%/lib/cpp ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

#############################################################################
echo ""
echo "Compiling extract-program-static-features MILEPOST\cTuning aux tool ..."

cd %INSTALL_DIR%\%PACKAGE_NAME%\src\extract-program-static-features\ml-feat-proc

make clean ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
make XSB_DIR=%CK_ENV_COMPILER_PROLOG% XSB_DIR_ADD=%XSB_DIR_ADD% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
make install INSTALL_DIR=%INSTALL_DIR_MINGW%/bin ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
make clean ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

echo.
echo Copying xsb.dll
echo.
cp -f %XSB_DIR%/config/%XSB_DIR_ADD%/bin/xsb.dll %INSTALL_DIR_MINGW%/bin

echo.
echo Copying default C .so
echo.
del /Q %INSTALL_DIR_MINGW%\lib\*.so
copy /B %INSTALL_DIR%\lib\c\*.so %INSTALL_DIR%\lib

exit /b 0