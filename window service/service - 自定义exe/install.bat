@echo off
set srvany_path=C:\healthCheckC#\srvany.exe
set service_name=healthCheck2
set exe_path=C:\Users\chenkaifei\source\repos\ServerLifeDetector\ServerLifeDetector\bin\Release\netcoreapp2.1\win10-x64\ServerLifeDetector.exe
set exe_dir=C:\Users\chenkaifei\source\repos\ServerLifeDetector\ServerLifeDetector\bin\Release\netcoreapp2.1\win10-x64

:: 如果曾经注册过则会有残留，先清理一下
net stop %service_name%
sc delete %service_name%

instsrv %service_name% %srvany_path%
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\%service_name%\Parameters" /v Application /t REG_SZ /d %exe_path%
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\%service_name%\Parameters" /v AppDirectory /t REG_SZ /d %exe_dir%
net start %service_name%

echo=>delete_%service_name%.bat
echo @echo off>>$
echo net stop %service_name%>>$
echo sc delete %service_name%>>$
move $ delete_%service_name%.bat