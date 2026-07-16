@echo off
FOR /F "tokens=1* delims==" %%A IN (.env) DO (
    SET %%A=%%B
)
set CLASSPATH=.;bin;config;%JX_HOME%\libs\jxclasses.jar;%JX_HOME%\libs\jdxtools.jar;%JX_HOME%\external_libs\json-20240303.jar;%JDBC_DRIVER_JAR%
