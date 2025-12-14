#!/bin/sh
set -e
for f in /docker-entrypoint.d/*.sh; do
  source $f
done

interval="$1"

# Setup the SSH connection
ssh_setup

file_path=${FILE_PATH:-""}

if [ -z "$file_path" ]; then
  lerror "FILE_PATH environment variable is not set. Exiting."
  exit 1
fi

ssh_dir=${SSH_REMOTE_DIR:-""}

rsnapshot_setup_sshfs "$ssh_dir"

linfo "Starting rsnapshot backup for path: $file_path with interval: ${interval}"
rsnapshot_backup "$file_path" "$interval"

rsnapshot_cleanup_sshfs
