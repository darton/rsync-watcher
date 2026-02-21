#!/bin/bash

FILE="$1"

REMOTE_USER="pi"
REMOTE_HOST="127.0.0.1"
REMOTE_DIR="~/monitory"
REMOTE_PORT=2211

if [ -d "$FILE" ]; then
    exit 0
fi

case "$FILE" in
    *.tmp|*.part|*.swp|*.swx|*.~lock.*|*.ht|*.env|*.partial
        exit 0
        ;;
esac

 
#echo "$(date '+%Y-%m-%d %H:%M:%S') Synchronizacja katalogu upload" >> "$HOME/rsync-runner.log"
rsync -avz -e "ssh -p $REMOTE_PORT" "$FILE" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}/"
