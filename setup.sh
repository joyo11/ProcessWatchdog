#!/bin/bash

SCRIPT_PATH="$(pwd)/watchdog.sh"
PROCESS_NAME="nginx"

echo "Setting up cron job to monitor '$PROCESS_NAME' every minute..."

(crontab -l 2>/dev/null; echo "* * * * * $SCRIPT_PATH $PROCESS_NAME") | crontab -

echo "Done. You can check logs in logs/watchdog.log"
