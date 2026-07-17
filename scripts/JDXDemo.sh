#!/bin/bash
cd "$(dirname "$0")/.."
source ./scripts/setEnvironment.sh
java -DJX_HOME="$JX_HOME" com.softwaretree.jdxtools.JDXDemo config/JDXDemo.config
