#!/bin/sh
set -e
for f in /docker-entrypoint.d/*.sh; do
  source $f
done

# Setup the SSH connection
ssh_setup

file_path=${FILE_PATH:-""}
if [ -z "$file_path" ]; then
  lerror "FILE_PATH is not set. Exiting."
fi
if [ ! -e "$file_path" ]; then
  lerror "File $file_path does not exist. Exiting."
fi

# Backup process
backup_dir="/tmp"
backup_file="file_backup.sql.gz"
backup_path="${backup_dir}/${backup_file}"

tar -czf $backup_path $file_path

file_info=$(ls -lh "$backup_path")
ldebug "Backup file at $backup_path info: $file_info"

ssh_dir=${SSH_REMOTE_DIR:-""}
ssh_send_file "$backup_path" "$ssh_dir"
