#!/bin/bash


# SSH connection setup
ssh_user=${SSH_USER:-"root"}
ssh_port=${SSH_PORT:-"22"}
ssh_host=${SSH_HOST:-""}
ssh_key_path=${SSH_KEY_PATH:-"/root/.ssh/id_ed25519"}
ssh_addr=${ssh_user}@${ssh_host}
ssh_opts="-o ConnectTimeout=5"

function ssh_setup() {
  if [ -z "$ssh_host" ]; then
    lerror "SSH_HOST is not set."
  fi

  ldebug "SSH connection: ${ssh_addr} on port ${ssh_port}"
  ldebug "SSH Keyfile Path: ${ssh_key_path}"

  linfo "Testing SSH connection..."
  ssh -i "${ssh_key_path}" -p$ssh_port ${ssh_opts} "${ssh_addr}" "ls" 1>/dev/null
  if [ $? -ne 0 ]; then
    lerror "SSH connection failed connecting to ${ssh_addr} on port ${ssh_port}. Exiting"
  fi
  linfo "SSH connection successful."
}

function ssh_send_file() {
  local source_path="$1"
  local dest_path="$2"

  if [ ! -f "$source_path" ]; then
    lerror "Source file $source_path does not exist."
  fi

  source_file=${source_path##*/}
  source_extension="${source_file#*.}"
  source_filename="${source_file%%.*}"
  backup_file="${source_filename}_$(date +%Y%m%d_%H%M%S).${source_extension}"
  backup_path="${backup_file}"
  if [[ "$dest_path" != "" ]]; then
    backup_path="${dest_path}/${backup_path}"
  fi
  ldebug "Prepared backup file name: ${backup_path}"

  linfo "Transferring backup to remote server..."
  scp -i "${ssh_key_path}" -P$ssh_port ${ssh_opts} "$source_path" "${ssh_addr}:${backup_path}"
  linfo "Backup transferred to ${ssh_addr}:${backup_path}"
}
