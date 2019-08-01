#!/usr/bin/env bash

readonly kafka_connect_url='http://localhost:8083'

echo 'Configuring SQL Server connector'

curl \
  -X POST \
  -H 'Content-Type: application/json' \
  -d '{
        "name": "poc-kafka-connector-mssql",
        "config": {
            "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
            "connection.url": "jdbc:sqlserver://sqlserver:1433;databaseName=poc",
            "connection.user": "sa",
            "connection.password": "BBk_.6WA!k3e",
            "topic.prefix": "poc-mssql-",
            "table.whitelist" : "demo",
            "mode":"incrementing",
            "incrementing.column.name": "id",
            "poll.interval.ms" : 30000
        }
      }' \
  "${kafka_connect_url}/connectors"

sleep 60s
