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
IF NOT "%CM_INSTALL_OBJ_DIR%"=="" mkdir %CM_INSTALL_OBJ_DIR%
IF NOT "%CM_INSTALL_DIR%\%CM_OS_LIB_DIR%"=="" mkdir %CM_INSTALL_DIR%\%CM_OS_LIB_DIR%
IF NOT "%CM_INSTALL_DIR%\bin"=="" mkdir %CM_INSTALL_DIR%\bin

IF NOT "%CM_PARALLEL_JOB_NUMBER%"=="" set pj=-j %CM_PARALLEL_JOB_NUMBER%

setlocal enabledelayedexpansion

rem  Misc vars
set ICI2_PLUGIN_VER=gcc-plugin-ici2

rem Prepare
mkdir %CM_INSTALL_DIR%

set dep_milepost_gcc=%CM_CODE_DEP_MILEPOST_GCC%
set dep_milepost_gcc_s=CM_%dep_milepost_gcc%_SRC
set dep_milepost_gcc_lib_gcc_plugin=CM_%dep_milepost_gcc%_LIB_GCC_PLUGIN
set dep_milepost_gcc_lib_gcc_plugin_cc=CM_%dep_milepost_gcc%_LIB_GCC_PLUGIN_CC
set dep_milepost_gcc_lib_gcc_plugin_fc=CM_%dep_milepost_gcc%_LIB_GCC_PLUGIN_FC
set dep_milepost_gcc_lib_gcc_plugin_cpp=CM_%dep_milepost_gcc%_LIB_GCC_PLUGIN_CPP

set r_dep_milepost_gcc_s=!%dep_milepost_gcc_s%!
set r_dep_milepost_gcc_lib_gcc_plugin=!%dep_milepost_gcc_lib_gcc_plugin%!
set r_dep_milepost_gcc_lib_gcc_plugin_cc=!%dep_milepost_gcc_lib_gcc_plugin_cc%!
set r_dep_milepost_gcc_lib_gcc_plugin_fc=!%dep_milepost_gcc_lib_gcc_plugin_fc%!
set r_dep_milepost_gcc_lib_gcc_plugin_cpp=!%dep_milepost_gcc_lib_gcc_plugin_cpp%!

cd /D %r_dep_milepost_gcc_s%
pwd > pwd.tmp
set /p e_dep_milepost_gcc_s= < pwd.tmp
del pwd.tmp

setlocal disabledelayedexpansion

mkdir %CM_INSTALL_DIR%\%CM_OS_LIB_DIR%
mkdir %CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\c
mkdir %CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\fortran
mkdir %CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\cpp

if NOT "%CM_SKIP_BUILD%" == "yes" (

 rem **********************************************************************
 echo.
 echo Compiling extract-program-structure ...
 echo.
 cd /D %CM_LOCAL_SRC_DIR%\src\extract-program-structure
 make clean MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cc%
 make MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cc%
 make install INSTALL_DIR=%CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\c ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

 make clean MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_fc%
 make MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_fc%
 make install INSTALL_DIR=%CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\fortran ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

 make clean MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cpp%
 make MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cpp%
 make install INSTALL_DIR=%CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\cpp ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

 rem **********************************************************************
 echo.
 echo Compiling save-executed-passes ...
 echo.
 cd /D %CM_LOCAL_SRC_DIR%\src\save-executed-passes
 make clean MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cc%
 make MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cc%
 make install INSTALL_DIR=%CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\c ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

 make clean MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_fc%
 make MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_fc%
 make install INSTALL_DIR=%CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\fortran ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

 make clean MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cpp%
 make MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cpp%
 make install INSTALL_DIR=%CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\cpp ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

 rem **********************************************************************
 echo.
 echo Compiling substitute-passes ...
 echo.
 cd /D %CM_LOCAL_SRC_DIR%\src\substitute-passes
 make clean MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cc%
 make MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cc%
 make install INSTALL_DIR=%CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\c ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

 make clean MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_fc%
 make MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_fc%
 make install INSTALL_DIR=%CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\fortran ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

 make clean MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cpp%
 make MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cpp%
 make install INSTALL_DIR=%CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\cpp ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

 rem **********************************************************************
 echo.
 echo Compiling extract-program-static-features ...
 echo.
 cd /D %CM_LOCAL_SRC_DIR%\src\extract-program-static-features
 make clean MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cc%
 make MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cc%
 make install INSTALL_DIR=%CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\c ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

 make clean MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_fc%
 make MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_fc%
 make install INSTALL_DIR=%CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\fortran ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

 make clean MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cpp%
 make MISCOPT=%CM_COMPILER_FLAGS_CC_OPTS% EXTRAINCLUDE=-I%e_dep_milepost_gcc_s% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER% LD_SHARED_EXTRA=%r_dep_milepost_gcc_lib_gcc_plugin_cpp%
 make install INSTALL_DIR=%CM_INSTALL_DIR%\%CM_OS_LIB_DIR%\cpp ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

 rem **********************************************************************
 echo.
 echo Compiling extract-program-static-features\ml-feat-proc ...
 echo.
 cd /D %CM_LOCAL_SRC_DIR%\src\extract-program-static-features\ml-feat-proc
 make clean XSB_DIR=%XSB_DIR% XSB_DIR_ADD=%XSB_DIR_ADD% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
 make XSB_DIR=%XSB_DIR% XSB_DIR_ADD=%XSB_DIR_ADD% ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%
 make install INSTALL_DIR=%CM_INSTALL_DIR%\bin ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%

 echo.
 echo Copying xsb.dll
 echo.
 copy /B %XSB_DIR%\config\%XSB_DIR_ADD%\bin\xsb.dll %CM_INSTALL_DIR%\bin

)

echo.>> %CM_CODE_ENV_FILE%
echo set CM_%CM_CODE_UID%_INSTALL=%CM_INSTALL_DIR%>> %CM_CODE_ENV_FILE%
echo set CM_%CM_CODE_UID%_BIN=%%CM_%CM_CODE_UID%_INSTALL%%\bin>> %CM_CODE_ENV_FILE%
echo set CM_%CM_CODE_UID%_SRC=%CM_LOCAL_SRC_DIR%>> %CM_CODE_ENV_FILE%
echo set CM_%CM_CODE_UID%_LIB=%%CM_%CM_CODE_UID%_INSTALL%%\%CM_OS_LIB_DIR%>> %CM_CODE_ENV_FILE%
echo set CM_%CM_CODE_UID%_INCLUDE=%%CM_%CM_CODE_UID%_INSTALL%%\include>> %CM_CODE_ENV_FILE%
echo.>> %CM_CODE_ENV_FILE%
echo set PATH=%%CM_%CM_CODE_UID%_BIN%%;%%PATH%%>> %CM_CODE_ENV_FILE%
echo set PATH=%%CM_%CM_CODE_UID%_INSTALL%%\bin;%%PATH%%>> %CM_CODE_ENV_FILE%
echo set LD_LIBRARY_PATH=%%CM_%CM_CODE_UID%_INSTALL%%\lib;%%LD_LIBRARY_PATH%%>> %CM_CODE_ENV_FILE%

echo set ICI2_PLUGIN_VER=%ICI2_PLUGIN_VER%>> %CM_CODE_ENV_FILE%
echo set ICI_LIB=%%CM_%CM_CODE_UID%_LIB%%>> %CM_CODE_ENV_FILE%
echo set ICI_PLUGIN_VER=%ICI2_PLUGIN_VER%>> %CM_CODE_ENV_FILE%
echo set CCC_ICI_USE=ICI_USE>> %CM_CODE_ENV_FILE%
echo set CCC_ICI_PLUGINS=ICI_PLUGIN>> %CM_CODE_ENV_FILE%
echo set CCC_ICI_PASSES_FN=ici_passes_function>> %CM_CODE_ENV_FILE%
echo set CCC_ICI_PASSES_EXT=.txt>> %CM_CODE_ENV_FILE%
echo set CCC_ICI_PASSES_RECORD_PLUGIN=%%ICI_LIB%%\%%ICI_PLUGIN_VER%%-extract-program-structure.so>> %CM_CODE_ENV_FILE%
echo set CCC_ICI_PASSES_RECORD_PLUGIN_CC=%%ICI_LIB%%\c\%%ICI_PLUGIN_VER%%-extract-program-structure.so>> %CM_CODE_ENV_FILE%
echo set CCC_ICI_PASSES_RECORD_PLUGIN_FC=%%ICI_LIB%%\fortran\%%ICI_PLUGIN_VER%%-extract-program-structure.so>> %CM_CODE_ENV_FILE%
echo set CCC_ICI_PASSES_RECORD_PLUGIN_CPP=%%ICI_LIB%%\cpp\%%ICI_PLUGIN_VER%%-extract-program-structure.so>> %CM_CODE_ENV_FILE%
echo set CCC_ICI_FEATURES_ST_FN=ici_features_function>> %CM_CODE_ENV_FILE%
echo set CCC_ICI_FEATURES_ST_EXT=.ft>> %CM_CODE_ENV_FILE%
echo set CCC_ICI_FEATURES_ST_EXTRACT_PLUGIN=%%ICI_LIB%%\%%ICI_PLUGIN_VER%%-extract-program-static-features.so>> %CM_CODE_ENV_FILE%
echo set CCC_ICI_FEATURES_ST_EXTRACT_PLUGIN_CC=%%ICI_LIB%%\c\%%ICI_PLUGIN_VER%%-extract-program-static-features.so>> %CM_CODE_ENV_FILE%
echo set CCC_ICI_FEATURES_ST_EXTRACT_PLUGIN_FC=%%ICI_LIB%%\fortran\%%ICI_PLUGIN_VER%%-extract-program-static-features.so>> %CM_CODE_ENV_FILE%
echo set CCC_ICI_FEATURES_ST_EXTRACT_PLUGIN_CPP=%%ICI_LIB%%\cpp\%%ICI_PLUGIN_VER%%-extract-program-static-features.so>> %CM_CODE_ENV_FILE%
echo set ICI_PROG_FEAT_PASS=fre>> %CM_CODE_ENV_FILE%
echo set ML_ST_FEAT_TOOL=%%CM_%CM_CODE_UID%_BIN%%\featlstn.P>> %CM_CODE_ENV_FILE%
echo set ICI_PROG_FEAT_EXT_TOOL=%%CM_%CM_CODE_UID%_BIN%%\ml-feat-proc>> %CM_CODE_ENV_FILE%

rem Cleaning directories if needed

exit /b 0
