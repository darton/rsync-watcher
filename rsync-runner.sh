#!/bin/bash

LOCAL_DIR="$HOME/upload/"
REMOTE_USER="pi"
REMOTE_HOST="127.0.0.1"
REMOTE_DIR="~/monitory"
REMOTE_PORT=2211

# Lockfile
exec 200>/tmp/rsync-upload.lock
flock -n 200 || exit 0

rsync -avz --delete -e "ssh -p $REMOTE_PORT" "$LOCAL_DIR" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}"
