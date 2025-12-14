#!/bin/sh
set -e
for f in /docker-entrypoint.d/*.sh; do
  source $f
done

# Inputs
interval="$1"
backup_dir="/tmp/pg_backup"

# SSH connection setup
pg_setup
ssh_setup

mkdir -p "$backup_dir"
rsnapshot_setup "$backup_dir/"

# Generate the PostgresSQL backup
backup_file="pg_backup.sql.gz"
backup_path="${backup_dir}/${backup_file}"
pg_backup_to_file "$backup_path"

file_info=$(ls -lh "$backup_path")
ldebug "Backup file at $backup_path info: $file_info"

ssh_dir=${SSH_REMOTE_DIR:-""}
ssh_send_file "$backup_path" "$ssh_dir"
