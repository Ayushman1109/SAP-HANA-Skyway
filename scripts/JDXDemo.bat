@echo off
cd /d "%~dp0.."
call scripts\setEnvironment
java -DJX_HOME=%JX_HOME% com.softwaretree.jdxtools.JDXDemo config\JDXDemo.config
