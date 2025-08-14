@echo off
title Computer Cleanup and Repair Script by Gemini

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

echo ==================================================
echo ==      Computer Cleanup and Repair Script      ==
echo ==================================================
echo.
echo This script will perform the following tasks:
echo   1. Flush DNS Cache
echo   2. Clean Temporary Files
echo   3. Empty the Recycle Bin
echo   4. Scan and Repair System Files
echo.
echo WARNING: This will permanently delete all files
echo in your Recycle Bin.
echo.
pause
echo.

echo [1/4] Flushing DNS Cache...
ipconfig /flushdns
echo Done. Progress: 25%% complete.
echo.

echo [2/4] Cleaning Temporary Files...
del /q /f /s %TEMP%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1
echo Done. Progress: 50%% complete.
echo.

echo [3/4] Emptying the Recycle Bin...
rd /s /q C:\$Recycle.Bin
echo Done. Progress: 75%% complete.
echo.

echo [4/4] Scanning and Repairing System Files...
echo (This is the longest step. The command will show its own progress.)
sfc /scannow
echo Done. Progress: 100%% complete.
echo.

echo ==================================================
echo ==           Operation Complete!                ==
echo ==================================================
echo.
echo You can close this window now.
echo.
pause