@echo off
setlocal

REM Requires env.cmd to have been run in this shell (PROJDIR/SRCDIR/DISKDIR/etc set)

echo ** Building HELLO **
echo    - Copying temp HELLO
copy /y "%SRCDIR%\HELLO.BAS" HELLO >nul
echo    - Deleting existing HELLO from disk
call acx delete -d "%DISKDIR%\WARDIAL.DSK" HELLO || echo HELLO not on disk image yet - continuing
echo    - Importing HELLO into disk
call acx import -d "%DISKDIR%\WARDIAL.DSK" HELLO --basic
echo    - Clearing temp HELLO
del /q HELLO

echo ** Building WARDIAL **
echo    - Copying temp WARDIAL
copy /y "%SRCDIR%\WARDIAL.BAS" WARDIAL >nul
echo    - Deleting existing WARDIAL from disk
call acx delete -d "%DISKDIR%\WARDIAL.DSK" WARDIAL || echo WARDIAL not on disk image yet - continuing
echo    - Importing WARDIAL into disk
call acx import -d "%DISKDIR%\WARDIAL.DSK" WARDIAL --basic
echo    - Clearing temp WARDIAL
del /q WARDIAL

echo ** DONE **
endlocal
