#!/bin/bash

WORKDIR=$(cd $(dirname ${0});pwd)

hostname=$(hostname)
eval "cat <<EOF
$(<"${WORKDIR}"/docker-compose.yaml.template)
EOF" >"${WORKDIR}"/docker-compose.yaml

cat "${WORKDIR}"/docker-compose.yaml

if [ "$1" = "up" ]; then
    docker-compose -f "${WORKDIR}"/docker-compose.yaml up -d
fi
