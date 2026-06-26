#!/bin/bash
USAGE=$(df -h / | tail -1 | awk '{print $5}' | sed 's/%//')
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

if [ "$USAGE" -gt 80 ]; then
  MSG="CRITICAL: Disk at ${USAGE}%"
elif [ "$USAGE" -gt 50 ]; then
  MSG="WARNING: Disk at ${USAGE}%"
else
  MSG="OK: Disk at ${USAGE}%"
fi

echo "$TIMESTAMP $MSG"
echo "$TIMESTAMP $MSG" >> app.log

