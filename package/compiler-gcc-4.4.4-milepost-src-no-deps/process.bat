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
echo Copying and extracting all files ...

del /s /f /q %INSTALL_DIR%\src

mkdir %INSTALL_DIR%\src

cd %INSTALL_DIR%\src

copy /B %PACKAGE_DIR%\dlfcn-win32-r19.tar.bz2 %INSTALL_DIR%\src
copy /B %PACKAGE_DIR%\milepost-gcc-4.4.4-mingw.tar.bz2 %INSTALL_DIR%\src
copy /B %PACKAGE_DIR%\mingw-get-0.5-mingw32-beta-20120426-1-bin.zip %INSTALL_DIR%\src

unzip mingw-get-0.5-mingw32-beta-20120426-1-bin.zip

bzip2 -d dlfcn-win32-r19.tar.bz2
tar xvf dlfcn-win32-r19.tar

bzip2 -d milepost-gcc-4.4.4-mingw.tar.bz2
tar xvf milepost-gcc-4.4.4-mingw.tar

echo.
echo Executing local installation script ...

set msys=%INSTALL_DIR%\src\msys\1.0\bin

echo.
echo Installing various mingw packages

cd /D %INSTALL_DIR%/src/bin
mingw-get install msys gcc mingw32-make gmp mpfr pthreads w32api mingw-runtime
rem msys pthreads mpc w32api mingw-runtime binutils gcc-core gcc g++ gcc-c++ mingw-utils autotools ld mingw32-make gfortran libc glibc mpfr gmp

echo.
echo Mounting /mingw to the root

cd /D %INSTALL_DIR%
%INSTALL_DIR%\src\msys\1.0\bin\sh -c "pwd > pwd.tmp"
set /p unix_cm_install_dir= < pwd.tmp
del pwd.tmp

echo %INSTALL_DIR%/src /mingw > %INSTALL_DIR%\src\msys\1.0\etc\fstab

echo.
echo Installing dlfcn for win32

cd %INSTALL_DIR%\src\etc\dlfcn-win32-r19
%MSYS%\sh -c "export PATH=/bin:/mingw/bin:$PATH; export LD_LIBRARY_PATH=/lib:/mingw/lib:$LD_LIBRARY_PATH; ./configure ; make ; make install"

echo.
echo Configuring MILEPOST GCC 4.4.4 ...

rem Get install path in unix format
cd /D %INSTALL_DIR%\src
pwd > pwd.tmp
set /p unix_cm_install_dir= < pwd.tmp
del pwd.tmp

cd /D %INSTALL_DIR%/src/etc/milepost-gcc-4.4.4

echo.
echo Patching for GCC 5.x+ ...
patch -p2 < %PACKAGE_DIR%\patch1

echo.
echo Copying libs to MILEPOST GCC - otherwise will not work ...

%MSYS%\sh -c "export PATH=/bin:/mingw/bin:$PATH; export LD_LIBRARY_PATH=/lib:/mingw/lib:$LD_LIBRARY_PATH; mkdir host-i686-pc-mingw32; mkdir host-i686-pc-mingw32/gcc; cp -rf /mingw/lib/* host-i686-pc-mingw32/gcc"

echo.
echo Configuring and making ...

%MSYS%\sh -c "export PATH=/bin:/mingw/bin:$PATH; export LD_LIBRARY_PATH=/lib:/mingw/lib:$LD_LIBRARY_PATH; export CFLAGS=-fgnu89-inline; ./configure --prefix=/mingw/etc/milepost-gcc-4.4.4-bin %CM_CONFIGURE_EXTRA_PARAMS% --disable-bootstrap --disable--multilib --enable-shared --enable-languages=c,fortran; make %pj%; make install %pj%"

echo.
echo Copying libs and include to MILEPOST GCC bin - otherwise will not work

%MSYS%\sh -c "export PATH=/bin:/mingw/bin:$PATH; export LD_LIBRARY_PATH=/lib:/mingw/lib:$LD_LIBRARY_PATH; cp -rf /mingw/lib /mingw/etc/milepost-gcc-4.4.4-bin; cp -rf /mingw/include /mingw/etc/milepost-gcc-4.4.4-bin;"

echo.
echo Copying libcc1.a, libf951.a and libcc1plus.a needed for dynamic plugins to MILEPOST GCC install lib

%MSYS%\sh -c "export PATH=/bin:/mingw/bin:$PATH; export LD_LIBRARY_PATH=/lib:/mingw/lib:$LD_LIBRARY_PATH; cp /mingw/etc/milepost-gcc-4.4.4/host-i686-pc-mingw32/gcc/libcc1.a /mingw/etc/milepost-gcc-4.4.4-bin/lib"
%MSYS%\sh -c "export PATH=/bin:/mingw/bin:$PATH; export LD_LIBRARY_PATH=/lib:/mingw/lib:$LD_LIBRARY_PATH; cp /mingw/etc/milepost-gcc-4.4.4/host-i686-pc-mingw32/gcc/libf951.a /mingw/etc/milepost-gcc-4.4.4-bin/lib"
%MSYS%\sh -c "export PATH=/bin:/mingw/bin:$PATH; export LD_LIBRARY_PATH=/lib:/mingw/lib:$LD_LIBRARY_PATH; cp /mingw/etc/milepost-gcc-4.4.4/host-i686-pc-mingw32/gcc/libcc1plus.a /mingw/etc/milepost-gcc-4.4.4-bin/lib"

exit /b 0
