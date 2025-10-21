#!/bin/bash
set -e

for f in /docker-entrypoint.d/*.sh; do
  source $f
done

if [ "$1" = 'file-backup.sh' ]; then
  . file-backup.sh
elif [ "$1" = 'postgres-backup.sh' ]; then
  . postgres-backup.sh
else
  exec "$@"
fi
