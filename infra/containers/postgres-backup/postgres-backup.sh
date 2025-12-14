#!/bin/sh
set -e
for f in /docker-entrypoint.d/*.sh; do
  source $f
done

# Database connection setup
db_host=${DB_HOST:-"localhost"}
db_port=${DB_PORT:-"5432"}
db_user=${DB_USER:-"postgres"}
db_password=${DB_PASSWORD:-""}

function pg_setup() {
  ldebug "Using database at ${db_host}:${db_port} as user ${db_user}"
  linfo "Testing DB connection..."
  PGHOST=$db_host PGPASSWORD=$db_password PGPORT=$db_port PGUSER=$db_user psql -c "SELECT 1;" 1>/dev/null
  linfo "Database connection successful."
}

function pg_backup() {
  local backup_path=$1
  # Backup process
  linfo "Starting database backup..."
  ldebug "Using database at ${db_host}:${db_port} as user ${db_user} for backup"
  PGHOST=$db_host PGPASSWORD=$db_password PGPORT=$db_port PGUSER=$db_user pg_dumpall | gzip > "$backup_path"
  linfo "Database backup created at $backup_path"
}

# SSH connection setup
pg_setup
ssh_setup

# Mount SSHFS
#backup_dir="/tmp/sshfs"
#sshfs_mount "backup_dir"

# Backup process
backup_dir="/tmp"
backup_file="pg_backup.sql.gz"
backup_path="${backup_dir}/${backup_file}"
pg_backup "$backup_path"

file_info=$(ls -lh "$backup_path")
ldebug "Backup file at $backup_path info: $file_info"

ssh_dir=${SSH_REMOTE_DIR:-""}
ssh_send_file "$backup_path" "$ssh_dir"
