#!/usr/bin/env bash

readonly debezium_connect_url='http://localhost:8083'

echo 'Configuring SQL Server connector'

curl \
  -i \
  -X POST \
  -H 'Content-Type: application/json' \
  -d '{
        "name": "poc-kafka-connector-mssql",
        "config": {
            "connector.class": "io.debezium.connector.sqlserver.SqlServerConnector",
            "tasks.max" : "1",
            "database.server.name" : "sqlserver",
            "database.hostname" : "sqlserver",
            "database.port" : "1433",
            "database.user" : "sa",
            "database.password" : "BBk_.6WA!k3e",
            "database.dbname" : "poc",
            "database.history.kafka.bootstrap.servers" : "kafka:29092",
            "database.history.kafka.topic": "schema-changes.poc"
        }
      }' \
  "${debezium_connect_url}/connectors"

echo

sleep 60s
