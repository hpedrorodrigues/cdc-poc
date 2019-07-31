#!/usr/bin/env bash

readonly current_dir="$(echo "${BASH_SOURCE[0]}" | xargs dirname)"

source "${current_dir}/configuration.sh"

echo 'Printing all kafka topics'
kafka::cli 'kafka-topics' --zookeeper 'zookeeper:2181' --list