#!/usr/bin/env bash

readonly current_dir="$(echo "${BASH_SOURCE[0]}" | xargs dirname)"

# Change directory to root folder
cd "${current_dir}/.."

# Start all containers
docker-compose up -d

# Wait until all images are up and running
sleep 60s

./scripts/kafka-connect/setup-mssql-connector.sh
./scripts/kafka/list-topics.sh
./scripts/sqlserver/populate-initial-data.sh
./scripts/kafka/list-topics.sh
./scripts/sqlserver/populate-more-changes.sh
./scripts/kafka/list-topics.sh
./scripts/kafka/consume-topic.sh
