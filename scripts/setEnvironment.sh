#!/bin/bash
cd "$(dirname "$0")/.."
export JX_HOME="D:/Gilhari-0.8.0b-SDK"
export CLASSPATH=.:bin:config:"$JX_HOME/libs/jxclasses.jar":"$JX_HOME/libs/jdxtools.jar":"$JX_HOME/external_libs/json-20240303.jar":"D:/Downloads/ngdbc-2.29.7.jar"
