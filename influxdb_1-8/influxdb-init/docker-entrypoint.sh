#!/bin/sh

HOST=${INFLUXDB_HOST:-influxdb-1.8}
PORT=${INFLUXDB_PORT:-8086}
USERNAME=${INFLUXDB_USERNAME:-influxdb}
PASSWORD=${INFLUXDB_PASSWORD:-influxdb.123}

response=$(curl -XPOST -s -u "${USERNAME}:${PASSWORD}" "http://${HOST}:${PORT}/query" --data-urlencode "q=show retention policies on prometheus")
result=$(echo ${response} |sed -ne "/database not found/ p")

if [ "${result}" != "" ]; then
    curl -XPOST -s -u "${USERNAME}:${PASSWORD}" "http://${HOST}:${PORT}/query" --data-urlencode "q=create database prometheus with duration 30d shard duration 1d"
fi
