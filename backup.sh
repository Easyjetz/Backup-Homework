#!/bin/bash
export PATH=/bin:/usr/bin:/usr/local/bin

BACKUP_DIR="/tmp/backup"
LOG_FILE="/var/log/backup.log"


/usr/bin/mkdir -p "$BACKUP_DIR"

/usr/bin/rsync -aHAX --delete --checksum --exclude='/.*' --progress "$HOME/" "$BACKUP_DIR/" &>> "$LOG_FILE"


if [ $? -eq 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup completed successfully" >> "$LOG_FILE"
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup failed" >> "$LOG_FILE"
fi
