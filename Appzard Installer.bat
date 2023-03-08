@echo off
echo This Script Was Created By Nakshtra For Making It Easier To Install Appzard For Users
echo In Order To Run This Script Please Run It As A Administrator.
echo If You Encounter A Bug Immediately Report Me: https://community.appzard.com/u/nakshtrathedeveloper/summary Thank You!
echo ======================================
echo     Appzard Installer By Nakshtra
echo ======================================

set /p choice="Do you want to install Required Tools? (yes/no): "

if /i "%choice%"=="yes" (
    echo Installing Java 8...
    powershell -Command "& {Invoke-WebRequest -Uri 'https://javadl.oracle.com/webapps/download/AutoDL?BundleId=241524_1f5b5a70bf22433b84d0e960903adac8' -OutFile 'java8.exe'}"
    start /wait java8.exe /s
    echo Java 8 installed successfully!

    echo Installing PostgreSQL...
    powershell -Command "& {Invoke-WebRequest -Uri 'https://get.enterprisedb.com/postgresql/postgresql-14.1-1-windows-x64.exe' -OutFile 'postgresql.exe'}"
    start /wait postgresql.exe /SILENT /COMPONENTS="postgres,pgadmin4,pgJDBC" /PASSWORD="admin" /D=C:\PostgreSQL
    echo PostgreSQL installed successfully!

    setx JAVA_HOME "C:\Program Files\Java\jdk1.8.0_301" /M
    setx Path "%Path%;%JAVA_HOME%\bin" /M
    echo Java environment variables set successfully!
) else (
    echo Java and PostgreSQL installation aborted.
)

echo All Done! You can now use Java and PostgreSQL for your development needs.
