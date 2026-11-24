@echo off
if /i "%~1"=="waiter" goto waiter
title AI413 App Server
cd /d "%~dp0"

echo Project folder: %cd%
echo.

where flutter >nul 2>&1
if errorlevel 1 (
  echo Flutter was not found. Open a new window and run: flutter --version
  echo If that fails, the PATH entry E:\develop\flutter\bin is missing.
  pause
  exit /b 1
)

if not exist "pubspec.yaml" (
  echo pubspec.yaml not found here. Keep this file in the project folder.
  pause
  exit /b 1
)

powershell -NoProfile -Command "if (Get-NetTCPConnection -LocalPort 8080 -State Listen -ErrorAction SilentlyContinue) { exit 0 } else { exit 1 }"
if not errorlevel 1 (
  echo Port 8080 is already in use. Probably the app is already running.
  echo Opening http://localhost:8080 ...
  start "" http://localhost:8080
  echo.
  echo If the page does not show the app, close the other window that runs it, then run this file again.
  pause
  exit /b 0
)

echo Starting the app server. First start can take a minute.
echo The browser opens by itself once the server is listening.
echo If it does not, open this link manually: http://localhost:8080
echo Keep this window open while you use the app. Press q here to stop.
echo.

start "AI413 browser opener" /min "%~f0" waiter

call flutter run -d web-server --web-port 8080

echo.
echo The server stopped.
pause
exit /b 0

:waiter
set "LOG=%TEMP%\ai413_waiter.log"
echo waiter started %date% %time% > "%LOG%"
for /l %%i in (1,1,180) do (
  powershell -NoProfile -Command "if (Get-NetTCPConnection -LocalPort 8080 -State Listen -ErrorAction SilentlyContinue) { exit 0 } else { exit 1 }"
  if not errorlevel 1 goto ready
  ping -n 3 127.0.0.1 >nul
)
echo gave up after about 6 minutes %date% %time% >> "%LOG%"
exit /b 1

:ready
echo port 8080 listening, opening browser %date% %time% >> "%LOG%"
start "" http://localhost:8080
echo opened >> "%LOG%"
exit /b 0