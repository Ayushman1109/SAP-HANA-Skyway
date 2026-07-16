@echo off
call setEnvironment
java -DJX_HOME=%JX_HOME% com.softwaretree.jdxtools.JDXDemo config\JDXDemo.config
