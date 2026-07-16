#!/bin/bash
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs -d '\n')
fi
export CLASSPATH=.:bin:config:"$JX_HOME/libs/jxclasses.jar":"$JX_HOME/libs/jdxtools.jar":"$JX_HOME/external_libs/json-20240303.jar":"$JDBC_DRIVER_JAR"
