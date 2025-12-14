VERSION ?= 0.2
PG_VERSION ?= 17

build-file-backup:
	podman build -t quay.io/b-3-n/file-backup:${VERSION}-alpine -f file-backup/Containerfile .

build-postgres-backup:
	podman build -t quay.io/b-3-n/postgres-backup:${PG_VERSION}-alpine-${VERSION} -f postgres-backup/Containerfile .

push-file-backup:
	podman push quay.io/b-3-n/file-backup:${VERSION}-alpine

push-postgres-backup:
	podman push quay.io/b-3-n/postgres-backup:${PG_VERSION}-alpine-${VERSION}

build-all: build-file-backup build-postgres-backup

push-all: push-file-backup push-postgres-backup

all: build-all push-all
