@echo off
:: ============================================================
::  QuickOff — CLI Launcher
::  Usage:
::    launch.bat           Open GUI widget
::    launch.bat h         Hibernate
::    launch.bat s         Sleep
::    launch.bat off       Shutdown now
::    launch.bat off 60    Shutdown in 60 seconds
::    launch.bat r         Restart now
::    launch.bat r 120     Restart in 120 seconds
::    launch.bat l         Lock PC
::    launch.bat lo        Sign Out
::    launch.bat abort     Cancel scheduled shutdown/restart
:: ============================================================
setlocal

if "%~1"==""       goto :gui
if /i "%~1"=="gui" goto :gui
if /i "%~1"=="h"   goto :hibernate
if /i "%~1"=="s"   goto :sleep
if /i "%~1"=="off" goto :shutdown
if /i "%~1"=="r"   goto :restart
if /i "%~1"=="l"   goto :lock
if /i "%~1"=="lo"  goto :signout
if /i "%~1"=="abort" goto :abort

echo [QuickOff] Unknown option: %~1
echo Run without arguments to open the GUI.
goto :eof

:gui
  start "" mshta.exe "%~dp0QuickOff.hta"
  goto :eof

:hibernate
  echo [QuickOff] Hibernating...
  shutdown /h
  goto :eof

:sleep
  echo [QuickOff] Sleeping...
  rundll32.exe powrprof.dll,SetSuspendState 0,1,0
  goto :eof

:shutdown
  set "T=%~2"
  if "%T%"=="" set T=0
  echo [QuickOff] Shutting down (delay: %T%s)...
  shutdown /s /t %T%
  goto :eof

:restart
  set "T=%~2"
  if "%T%"=="" set T=0
  echo [QuickOff] Restarting (delay: %T%s)...
  shutdown /r /t %T%
  goto :eof

:lock
  echo [QuickOff] Locking PC...
  rundll32.exe user32.dll,LockWorkStation
  goto :eof

:signout
  echo [QuickOff] Signing out...
  shutdown /l
  goto :eof

:abort
  echo [QuickOff] Aborting scheduled action...
  shutdown /a
  goto :eof
