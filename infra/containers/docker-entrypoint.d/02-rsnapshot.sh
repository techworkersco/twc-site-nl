#!/bin/bash

RSNAPSHOT_CONFIG_PATH=${RSNAPSHOT_CONFIG_PATH:-/tmp/rsnapshot.conf}
RSNAPSHOT_ROOT=${RSNAPSHOT_ROOT:-/tmp/rsnapshot/}
RSNAPSHOT_CMD_RSYNC=${RSNAPSHOT_CMD_RSYNC:-/usr/bin/rsync}
RSNAPSHOT_CMD_CP=${RSNAPSHOT_CMD_CP:-/bin/cp}
RSNAPSHOT_CMD_RM=${RSNAPSHOT_CMD_RM:-/bin/rm}
RSNAPSHOT_RETAIN_DAILY=${RSNAPSHOT_RETAIN_DAILY:-7}
RSNAPSHOT_RETAIN_WEEKLY=${RSNAPSHOT_RETAIN_WEEKLY:-4}

ldebug "RSNAPSHOT_CONFIG_PATH: $RSNAPSHOT_CONFIG_PATH"
ldebug "RSNAPSHOT_ROOT: $RSNAPSHOT_ROOT"
ldebug "RSNAPSHOT_CMD_RSYNC: $RSNAPSHOT_CMD_RSYNC"
ldebug "RSNAPSHOT_CMD_CP: $RSNAPSHOT_CMD_CP"
ldebug "RSNAPSHOT_CMD_RM: $RSNAPSHOT_CMD_RM"
ldebug "RSNAPSHOT_RETAIN_DAILY: $RSNAPSHOT_RETAIN_DAILY"
ldebug "RSNAPSHOT_RETAIN_WEEKLY: $RSNAPSHOT_RETAIN_WEEKLY"

function rsnapshot_write_config() {
  local backup_path=$1
  if [ -f "$RSNAPSHOT_CONFIG_PATH" ]; then
    linfo "rsnapshot config file $RSNAPSHOT_CONFIG_PATH already exists. Skipping creation."
    return
  fi
  cat <<EOF > $RSNAPSHOT_CONFIG_PATH
config_version	1.2
snapshot_root	${RSNAPSHOT_ROOT}

cmd_rsync	${RSNAPSHOT_CMD_RSYNC}
cmd_cp	${RSNAPSHOT_CMD_CP}
cmd_rm	${RSNAPSHOT_CMD_RM}

retain	daily	${RSNAPSHOT_RETAIN_DAILY}
retain	weekly	${RSNAPSHOT_RETAIN_WEEKLY}

sync_first	1

backup	${backup_path}	localhost/
EOF

  linfo "rsnapshot config file created at $RSNAPSHOT_CONFIG_PATH"
}

function rsnapshot_setup_sshfs() {
  local remote_dir=$1
  sshfs_mount "${RSNAPSHOT_ROOT}" "${remote_dir}"
}

function rsnapshot_cleanup_sshfs() {
  sshfs_umount "${RSNAPSHOT_ROOT}"
}

function rsnapshot_backup() {
  local backup_path=${1}
  local interval=${2:-daily}
  rsnapshot_write_config "$backup_path"

  # check iterval is valid
  if [[ "$interval" != "daily" && "$interval" != "weekly" ]]; then
    lerror "Invalid rsnapshot interval: $interval. Must be 'daily' or 'weekly'."
    return 1
  fi

  rsnapshot -V -c "$RSNAPSHOT_CONFIG_PATH" "$interval"
}
