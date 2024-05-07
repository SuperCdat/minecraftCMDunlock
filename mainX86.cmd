@echo off

if %PROCESSOR_ARCHITECTURE% == AMD64 (
   echo please run 64-bit version
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

start resources\commands\movedlls32.cmd

timeout 2 > NUL
echo.
echo The process has been completed successfully!

timeout 1 > NUL
pause