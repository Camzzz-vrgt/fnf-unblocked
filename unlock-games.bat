@echo off
REM ============================================================
REM  FNF - hosts file cleanup (NOT needed anymore)
REM
REM  Older versions asked you to map w8.snokido.com to 127.0.0.1
REM  so domain-locked Snokido builds would run. Those builds are
REM  now patched directly, so the entry is useless - this script
REM  just removes it if it's still there.
REM ============================================================

findstr /C:"w8.snokido.com" "%WINDIR%\System32\drivers\etc\hosts" >nul 2>&1
if not %errorlevel%==0 (
  echo Nothing to do - no w8.snokido.com entry in your hosts file.
  pause
  exit /b 0
)

echo Removing the old w8.snokido.com hosts entry (needs admin once)...
powershell -NoProfile -Command "Start-Process powershell -Verb RunAs -Wait -ArgumentList '-NoProfile','-Command','(Get-Content $env:WINDIR\System32\drivers\etc\hosts) | Where-Object {$_ -notmatch \"w8.snokido.com\"} | Set-Content $env:WINDIR\System32\drivers\etc\hosts'"

findstr /C:"w8.snokido.com" "%WINDIR%\System32\drivers\etc\hosts" >nul 2>&1
if %errorlevel%==0 (
  echo Still there - the elevated step may have been cancelled.
) else (
  echo Cleaned. All games run directly now - no hosts entry needed.
)
pause
