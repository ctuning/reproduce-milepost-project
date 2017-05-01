call _clean.bat

call ck xset env tags=compiler,ctuning-cc && call tmp-ck-env.bat && del /Q tmp-ck-env.bat
if %errorlevel% neq 0 exit /b %errorlevel%

mkdir tmp
cp -rf *.c tmp
cd tmp

set ICI_VERBOSE=YES
%CK_CC% -O3 ctuning-rtl.c susan.c --ct-extract-features -lm

%CK_OBJDUMP% a.exe > a.lst
