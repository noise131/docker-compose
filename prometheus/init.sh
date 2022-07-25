#!/bin/bash

set -e

WORKDIR_TMP=$(cd $(dirname ${0});pwd)
WORKDIR=$(echo "${WORKDIR_TMP}"|sed -r "s/^[ ]*|[ ]*$//g")

mkdir -p /containers_volume/influxdb
\cp -a "${WORKDIR}"/prometheus /containers_volume/
echo "prometheus-db-grafana : init success !"

if [ "$1" = 'up' ]; then
    docker-compose -f "${WORKDIR}"/docker-compose.yaml up -d
fi
