@echo off

if %PROCESSOR_ARCHITECTURE% == AMD64 (
   echo please run 64-bit version
   timeout 2 > NUL
   exit
)

cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %Apply%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

title Working
if %errorLevel% == 0 ( echo Do you want to continue?
) else (
    echo please run as ADMINISTRATOR
    PING 127.0.0.1 > NUL 2>&1
    EXIT /B 1
)

timeout 1 > NUL
set /p ans=y[yes] or n[no]: 
If %ans% == y (timeout 2 > NUL) ELSE (exit)

echo.
echo RUNNING...
timeout 1 > NUL

cd %~dp0
start resources\commands\movedlls32.cmd

timeout 2 > NUL
echo.
echo The process has been completed successfully!

timeout 1 > NUL
pause