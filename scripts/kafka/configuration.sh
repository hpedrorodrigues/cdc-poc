#!/usr/bin/env bash

function kafka::cli() {
  docker exec -it kafka "${@}"
}