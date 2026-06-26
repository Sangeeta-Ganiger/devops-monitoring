#!/bin/bash
LOG="/home/sangeeta/myapp/server.log"
REPORT="/home/sangeeta/myapp/report-$(date '+%Y-%m-%d').txt"
find ~/myapp -name "report-*.txt" -mtime +7 -delete
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

ERROR_COUNT=$(grep "ERROR" $LOG | wc -l)
WARN_COUNT=$(grep "WARNING" $LOG | wc -l)
LAST_ERROR=$(grep "ERROR" $LOG | tail -1)

echo "=================================" >> $REPORT
echo "Report generated: $TIMESTAMP" >> $REPORT
echo "Total errors: $ERROR_COUNT" >> $REPORT
echo "Total warnings: $WARN_COUNT" >> $REPORT
echo "Last error: $LAST_ERROR" >> $REPORT

echo "Scan complete. $ERROR_COUNT errors found."
