#! /bin/bash

rem
rem Installation script for CK packages.
rem
rem See CK LICENSE.txt for licensing details.
rem See CK Copyright.txt for copyright details.
rem
rem Developer(s): Grigori Fursin, 2015
rem

set PACKAGE_NAME=CCC-2.5-with-ml-plugins

cd %INSTALL_DIR%
cp %PACKAGE_DIR%\%PACKAGE_NAME%.tar.gz .
gzip -d %PACKAGE_NAME%.tar.gz
tar xvf %PACKAGE_NAME%.tar
rm %PACKAGE_NAME%.tar

rem Make
cd /D %INSTALL_DIR%\ccc-framework\src-plat-dep\tools\ctuning-cc
mingw32-make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% COMPILER=%CK_CC%
mingw32-make install DEST=%INSTALL_DIR%

cd /D %INSTALL_DIR%\ccc-framework\src-plat-dep\plugins\ml\ccc-ml-accumulate-features
mingw32-make MISCOPT=%CK_COMPILER_FLAGS_CC_OPTS% COMPILER=%CK_CC%
mingw32-make install DEST=%INSTALL_DIR%

cp -rf %INSTALL_DIR%\ccc-framework\src-plat-indep %INSTALL_DIR%\src-plat-indep

exit /b 0
