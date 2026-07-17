@echo off
cd /d "%~dp0.."
call scripts\setEnvironment
rem Clean the package bin directory to remove stale .class files
if exist bin\com\poc\hana\model rmdir /s /q bin\com\poc\hana\model
mkdir bin\com\poc\hana\model
dir /s /b src\*.java > sources.txt
javac -source 8 -target 8 -d bin -cp .;bin;%JX_HOME%\libs\jxclasses.jar;%JX_HOME%\external_libs\json-20240303.jar;D:/Downloads/ngdbc-2.29.7.jar @sources.txt
if %ERRORLEVEL% == 0 (
    echo Compilation completed successfully.
) else (
    echo Compilation failed.
    exit /b 1
)
