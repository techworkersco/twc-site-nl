#!/bin/sh

# Database connection setup
db_host=${DB_HOST:-"localhost"}
db_port=${DB_PORT:-"5432"}
db_user=${DB_USER:-"postgres"}
db_password=${DB_PASSWORD:-""}


function pg_setup() {
  ldebug "DB_HOST: $db_host"
  ldebug "DB_PORT: $db_port"
  ldebug "DB_USER: $db_user"
  ldebug "DB_PASSWORD: ${#db_password}"

  linfo "Testing DB connection..."
  PGHOST=$db_host PGPASSWORD=$db_password PGPORT=$db_port PGUSER=$db_user psql -c "SELECT 1;" 1>/dev/null
  linfo "Database connection successful."
}

function pg_backup_to_file() {
  local backup_path=$1
  # Backup process
  linfo "Starting database backup..."
  PGHOST=$db_host PGPASSWORD=$db_password PGPORT=$db_port PGUSER=$db_user pg_dumpall | gzip > "$backup_path"
  linfo "Database backup created at $backup_path"
}
