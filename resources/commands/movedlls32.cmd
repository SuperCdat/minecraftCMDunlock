@echo off

cd resources\dlls\X86\
takeown /F "C:\Windows\System32\Windows.ApplicationModel.Store.dll"
copy "System32\Windows.ApplicationModel.Store.dll" "C:\Windows\System32"

exit