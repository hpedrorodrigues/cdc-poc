#!/usr/bin/env bash

readonly current_dir="$(echo "${BASH_SOURCE[0]}" | xargs dirname)"

source "${current_dir}/configuration.sh"

sqlserver::run_query "
BEGIN TRANSACTION;
INSERT INTO demo (id, message) VALUES (3, 'Third row');
INSERT INTO demo (id, message) VALUES (4, 'The last one');
COMMIT;
"
