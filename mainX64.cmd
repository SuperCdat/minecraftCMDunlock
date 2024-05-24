@echo off

if %PROCESSOR_ARCHITECTURE% == x86 (
   echo please run 32-bit version
   timeout 2 > NUL
   exit
)

net session >nul 2>&1
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
start resources\commands\movedlls64.cmd

timeout 4 > NUL
echo.
echo The process has been completed successfully!

timeout 1 > NUL
pause
