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

MEM=$(free -h | grep Mem | awk '{print $3}')
echo "$TIMESTAMP Memory in use: $MEM"
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
echo "$TIMESTAMP CPU usage: ${CPU}%"
