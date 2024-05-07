@echo off

cd resources\dlls\X64\
takeown /F "C:\Windows\System32\Windows.ApplicationModel.Store.dll"
copy "System32\Windows.ApplicationModel.Store.dll" "C:\Windows\System32"

takeown /F "C:\Windows\SysWOW64\Windows.ApplicationModel.Store.dll"
copy "SysWOW64\Windows.ApplicationModel.Store.dll" "C:\Windows\SysWOW64"

exit