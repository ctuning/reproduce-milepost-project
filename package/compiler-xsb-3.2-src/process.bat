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
mkdir %INSTALL_DIR%

cd %INSTALL_DIR%

del /s /f /q %INSTALL_DIR%\Xsb-3-2-7-Windows-Compiled

copy /B %PACKAGE_DIR%\XSBWindows.zip .

unzip XSBWindows.zip

rem Cleaning directories if needed

exit /b 0
