#!/bin/sh
set -e
for f in /docker-entrypoint.d/*.sh; do
  source $f
done

# Inputs
interval="$1"

# Validate inputs
file_path=${FILE_PATH:-""}

if [ -z "$file_path" ]; then
  lerror "FILE_PATH environment variable is not set. Exiting."
  exit 1
fi

# Setup
ssh_setup
rsnapshot_setup "$file_path/"

# Backup
rsnapshot_setup_sshfs

rsnapshot_backup "$interval"

rsnapshot_cleanup_sshfs
