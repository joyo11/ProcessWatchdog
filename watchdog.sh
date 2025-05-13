#!/bin/bash

PROCESS_NAME="$1"
LOG_FILE="logs/watchdog.log"

if [ -z "$PROCESS_NAME" ]; then
    echo "Usage: $0 <process-name>"
    exit 1
fi

if ! pgrep -x "$PROCESS_NAME" > /dev/null; then
    echo "$(date): $PROCESS_NAME not running. (No restart attempted on macOS)" >> "$LOG_FILE"
else
    echo "$(date): $PROCESS_NAME is running fine." >> "$LOG_FILE"
fi
