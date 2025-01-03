#!/bin/bash

SOURCE_DIR="/home/lin"
DEST_DIR="/media/lin/backup/home_backup"
LOG_FILE="/media/lin/backup/home_backup/log/home_backup.log"

TIMESTAMP="$(date +"%Y-%m-%d")"

tar --warning=no-file-changed -czvf backup_"$TIMESTAMP".tar.gz --exclude="$SOURCE_DIR"/.cache --exclude="$SOURCE_DIR"/.local --exclude="$SOURCE_DIR"/Downloads  --exclude="$SOURCE_DIR"/.config --exclude="$SOURCE_DIR"/backup_home.sh "$SOURCE_DIR"

if [ $? -eq 1 ]; then
	echo "[$(date)] Pack and Compress Succeeded!" >> "$LOG_FILE"
else
    echo "[$(date)] Pack and Compress Failed!" >> "$LOG_FILE"
fi

mv backup_"$TIMESTAMP".tar.gz "$DEST_DIR"

if [ $? -eq 0 ]; then
	echo "[$(date)] Backup Succeeded!" >> "$LOG_FILE"
else
    echo "[$(date)] Backup Failed!" >> "$LOG_FILE"
fi

rm -rf /media/lin/backup/.Trash-1000

exit
