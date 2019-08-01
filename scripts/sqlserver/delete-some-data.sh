#!/usr/bin/env bash

readonly current_dir="$(echo "${BASH_SOURCE[0]}" | xargs dirname)"

source "${current_dir}/configuration.sh"

sqlserver::run_query "DELETE FROM demo WHERE id IN (1, 3);"
