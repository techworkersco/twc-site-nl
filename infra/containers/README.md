# backup containers

This directory contains a collection of containers to help with backing up data.

## Contaienrs

- `quay.io/b-3-n/postgres-backup` - A container that inherits from `postgres:<v>-alpine` and installs a SSH client for remote backups.
- `quay.io/b-3-n/file-backup` - A container based on `alpine` with an installed SSH client for remote backups.

## Building

Podman/Docker:

```sh
podman build -t quay.io/b-3-n/<container>:latest -f <contianer>/Containerfile .
```

e.g.

```sh
podman build -t quay.io/b-3-n/file-backup:latest -f file-backup/Containerfile .
```

> [!NOTE]
> The above command is run from this directory, not the container sub-directory.

## Usage

### `postgres-backup`

Connects to a given Postgres, runs a `pg_dumpall`, throws it into a gzip, and uploads to ssh.

```
podman run \
    --rm \
    --env SSH_HOST=backup.example.com \
    quay.io/b-3-n/postgres-backup:latest
```

Required ENV vars:

- `SSH_HOST`: SSH hostname for the backup destination

Optional ENV vars:

- `DEBUG`: Extra logs (default: `0`)
- `DB_HOST`: Hostname of the Postgres database (default: `localhost`)
- `DB_PORT`: Port of the Postgres database (default: `5432`)
- `DB_USER`: Username for the Postgres database (default: `postgres`)
- `DB_PASSWORD`: Password for the Postgres database (default: empty)
- `SSH_USER`: SSH username for the backup destination (default: `root`)
- `SSH_PORT`: SSH port for the backup destination (default: `22`)
- `SSH_REMOTE_DIR`: Directory on the backup destination to store backups (default: `""`)

### `file-backup`

Takes whatever is in $FILE_PATH, tar+gzips it, uploads to ssh.

```
podman run \
    --rm \
    --env SSH_HOST=backup.example.com \
    --env FILE_PATH=/data/ \
    quay.io/b-3-n/file-backup:latest
```

Required ENV vars:

- `SSH_HOST`: SSH hostname for the backup destination
- `FILE_PATH`: The directory to back up 

Optional ENV vars:

- `DEBUG`: Extra logs (default: `0`)
- `DB_HOST`: Hostname of the Postgres database (default: `localhost`)
- `DB_PORT`: Port of the Postgres database (default: `5432`)
- `DB_USER`: Username for the Postgres database (default: `postgres`)
- `DB_PASSWORD`: Password for the Postgres database (default: empty)
- `SSH_USER`: SSH username for the backup destination (default: `root`)
- `SSH_PORT`: SSH port for the backup destination (default: `22`)
- `SSH_REMOTE_DIR`: Directory on the backup destination to store backups (default: `""`)
