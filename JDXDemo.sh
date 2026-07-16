#!/bin/bash
source ./setEnvironment.sh
java -DJX_HOME="$JX_HOME" com.softwaretree.jdxtools.JDXDemo config/JDXDemo.config
