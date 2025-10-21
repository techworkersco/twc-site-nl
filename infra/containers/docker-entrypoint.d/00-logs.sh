#!/bin/bash

DEBUG=${DEBUG:-"0"}

function log() {
  echo "$(date -Iseconds) $1"
}

function ldebug() {
  if [ "$DEBUG" = "1" ]; then
    log "[DEBUG] $1"
  fi
}

function linfo() {
  log "[INFO] $1"
}

function lerror() {
  log "[ERROR] $1"
  exit 1
}
