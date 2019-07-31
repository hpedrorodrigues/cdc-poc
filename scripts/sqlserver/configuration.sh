#!/usr/bin/env bash

function sqlserver::run_query() {
  docker exec -it 'sqlserver' '/opt/mssql-tools/bin/sqlcmd' \
    -S 'localhost' \
    -U 'sa' \
    -P 'BBk_.6WA!k3e' \
    -d 'poc' \
    -Q "${@}"
}