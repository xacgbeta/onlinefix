@echo off
TITLE Hitman 3 Launcher

set "HOST=localhost"
set "PORT=6969"

set "HITMAN=%~dp0" 
set "PEACOCK=%HITMAN%Peacock"
set "EXENAME=%HITMAN%steamclient_loader_x64.exe"

:: delay launching patcher by 1 second to prevent the patcher from exiting early if your PC is too fast
start "" "%EXENAME%"
timeout /T 1 /NOBREAK >NUL

:: launch memory patcher and the hitman server emulator
pushd "%PEACOCK%"
PeacockPatcher.exe --headless --domain %HOST%:%PORT%
call "Start Server.cmd"
popd
