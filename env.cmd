@echo off
REM ==================================================
REM WARDIAL development environment setup
REM ==================================================

REM Base project directory
set "PROJDIR=C:\Projects\Wardialer"

REM Project subdirectories
set "SRCDIR=%PROJDIR%\Source"
set "TOOLSDIR=%PROJDIR%\Tools"
set "DISKDIR=%PROJDIR%\Disks"
set "BINDIR=%PROJDIR%\bin"

REM Add tools directory to PATH (session only)
set "PATH=%TOOLSDIR%;%BINDIR%;%PATH%"

REM Optional: confirm environment
echo WARDIAL environment configured.
echo PROJDIR=%PROJDIR%
echo SRCDIR=%SRCDIR%
echo TOOLSDIR=%TOOLSDIR%
echo BINDIR=%BINDIR%
echo DISKDIR=%DISKDIR%
