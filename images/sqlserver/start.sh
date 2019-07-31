#!/usr/bin/env bash

# Start SQL Server
/opt/mssql/bin/sqlservr &

# Wait for the SQL Server to come up
sleep 60s

# Run the sql scripts
for script in /poc/*.sql; do
  /opt/mssql-tools/bin/sqlcmd \
    -S 'localhost' \
    -U 'sa' \
    -P "${SA_PASSWORD}" \
    -d 'master' \
    -i "${script}"
done

# Wait until SQL Server finishes
wait $(jobs -p)
