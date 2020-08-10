#!/bin/bash
cd ${TOMCAT_HOME}/bin
./startup.sh
cd ${TOMCAT_HOME}/logs
tail -f catalina.out
