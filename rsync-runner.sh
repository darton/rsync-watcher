#!/bin/bash

LOCAL_DIR="$HOME/upload/"

REMOTE_USER="pi"
REMOTE_HOST="127.0.0.1"
REMOTE_DIR="~/monitory"
REMOTE_PORT=2211

# 
#echo "$(date '+%Y-%m-%d %H:%M:%S') Synchronizacja katalogu upload" >> "$HOME/rsync-runner.log"
rsync -avz --delete -e "ssh -p $REMOTE_PORT" "$LOCAL_DIR" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}"
