#!/bin/bash
LOG=$LOG_PATH
THRESHOLD=10
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
LAST_COUNT_FILE=$LAST_COUNT_PATH

ERROR_COUNT=$(grep "ERROR" $LOG | wc -l)
LAST_ERROR=$(grep "ERROR" $LOG | tail -1)

if [ -f "$LAST_COUNT_FILE" ]; then
  LAST_COUNT=$(cat $LAST_COUNT_FILE)
else
  LAST_COUNT=0
fi

function send_alert {
  curl -s -X POST -H 'Content-type: application/json' \
  --data "{\"text\":\"🚨 ALERT: $1\"}" \
  $SLACK_WEBHOOK
}

if [ "$ERROR_COUNT" -gt "$THRESHOLD" ] && [ "$ERROR_COUNT" -gt "$LAST_COUNT" ]; then
  send_alert "[$TIMESTAMP] $ERROR_COUNT errors found. Last error: $LAST_ERROR"
  echo $ERROR_COUNT > $LAST_COUNT_FILE
elif [ "$ERROR_COUNT" -gt "$THRESHOLD" ] && [ "$ERROR_COUNT" -eq "$LAST_COUNT" ]; then
  echo "SUPPRESSED: Still $ERROR_COUNT errors but no new ones. No alert sent."
else
  echo "OK: $ERROR_COUNT errors. Below threshold. No alert sent."
fi
