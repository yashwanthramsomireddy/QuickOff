@echo off
:: ============================================================
::  QuickOff — Setup Script
::  Enables or removes autostart on Windows login
::  Run as normal user (no admin needed — uses HKCU)
:: ============================================================
setlocal

set "APP=QuickOff"
set "HTA=%~dp0QuickOff.hta"
set "REG_KEY=HKCU\Software\Microsoft\Windows\CurrentVersion\Run"

echo.
echo  ========================================
echo   QuickOff Setup
echo  ========================================
echo.
echo   [1] Enable autostart on Windows login
echo   [2] Disable autostart
echo   [3] Launch QuickOff now
echo   [4] Exit
echo.
set /p CHOICE=  Your choice:

if "%CHOICE%"=="1" goto :enable
if "%CHOICE%"=="2" goto :disable
if "%CHOICE%"=="3" goto :launch
if "%CHOICE%"=="4" goto :eof

echo   Invalid choice.
goto :eof

:enable
  reg add "%REG_KEY%" /v "%APP%" /t REG_SZ /d "mshta.exe \"%HTA%\"" /f >nul
  echo.
  echo   [OK] QuickOff will start automatically on login.
  echo        Path: %HTA%
  echo.
  pause
  goto :eof

:disable
  reg delete "%REG_KEY%" /v "%APP%" /f >nul 2>&1
  echo.
  echo   [OK] Autostart removed.
  echo.
  pause
  goto :eof

:launch
  start "" mshta.exe "%HTA%"
  goto :eof
