#!/usr/bin/env bash

readonly current_dir="$(echo "${BASH_SOURCE[0]}" | xargs dirname)"
readonly kafka_connect_topic='poc-mssql-demo'

source "${current_dir}/configuration.sh"

function kafka::consume::topic() {
  local -r topic="${@}"
  echo "Consuming topic ${topic}"

  kafka::cli 'kafka-console-consumer' \
  --bootstrap-server 'kafka:29092' \
  --topic "${topic}" \
  --from-beginning
}


kafka::consume::topic "${kafka_connect_topic}"