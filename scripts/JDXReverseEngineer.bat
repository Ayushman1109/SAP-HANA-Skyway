@echo off
cd /d "%~dp0.."
call scripts\setEnvironment
java -DJX_HOME=%JX_HOME% com.softwaretree.jdxtools.JDXSchema -reverseEng config\reverse_eng_template.config
