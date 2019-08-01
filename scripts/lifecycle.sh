#!/usr/bin/env bash

readonly current_dir="$(echo "${BASH_SOURCE[0]}" | xargs dirname)"

# Change directory to root folder
cd "${current_dir}/.."

echo 'Starting all containers'
docker-compose up -d

echo 'Waiting until all images are up and running'
sleep 90s

./scripts/kafka-connect/setup-mssql-connector.sh

./scripts/kafka/list-topics.sh
./scripts/sqlserver/populate-initial-data.sh

./scripts/kafka/list-topics.sh
./scripts/sqlserver/populate-more-changes.sh

./scripts/kafka/list-topics.sh
./scripts/kafka/consume-topic.sh
