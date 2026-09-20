#!/bin/bash

SOURCE=${1:-}
BACKUP_DIR=${2:-}

if [ -z "$SOURCE" ] || [ -z "$BACKUP_DIR" ]; then
    echo "Usage: $0 <source> <backup-directory>"
    exit 1
fi

if [ ! -e "$SOURCE" ]; then
    echo "ERROR: Source does not exist: $SOURCE"
    exit 1
fi

mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

echo "Backing up: $SOURCE"
echo "Destination: $BACKUP_FILE"

if tar -czf "$BACKUP_FILE" "$SOURCE"; then
    echo "SUCCESS: Backup created"
    echo "$BACKUP_FILE"
else
    echo "ERROR: Backup failed"
    exit 1
fi