#!/usr/bin/env bash
# Script to run a java application for testing jmx4prometheus.

RUNDIR=${RUNDIR:-/usr/local/jmx_exporter}
echo RUNDIR $RUNDIR

BIND_HOST=${BIND_HOST:-localhost}
BIND_PORT=${BIND_PORT:-39390}
BIND_HOST_PORT=$BIND_HOST:$BIND_PORT
echo BINDING TO HOST:PORT $BIND_HOST_PORT

CONFIG_FILE_DIR=${CONFIG_FILE_DIR:-/tmp/jmx_exporter.yml}
echo GOING TO USE $CONFIG_FILE_DIR AS INPUT CONFIG 
echo THERFORE IT NEEDS TO BE MOUNTED FROM THE HOST (-v YOUR_PATH/your_config.yml:/tmp/jmx_exporter.yml)

VERSION=$JMX_PROMETHEUS_VERSION
echo using jar jmx_prometheus_httpserver-${VERSION}-jar-with-dependencies.jar

java -jar  $RUNDIR/jmx_prometheus_httpserver/target/jmx_prometheus_httpserver-${VERSION}-jar-with-dependencies.jar $BIND_HOST_PORT $CONFIG_FILE_DIR

