#!/bin/bash

LOG_FILE=${1:-}

if [ -z "$LOG_FILE" ]; then
    echo "Usage: $0 <log-file>"
    exit 1
fi

if [ ! -f "$LOG_FILE" ]; then
    echo "ERROR: File does not exist: $LOG_FILE"
    exit 1
fi

echo "======================================"
echo "LOG ANALYSIS REPORT"
echo "======================================"
echo "File: $LOG_FILE"
echo "Date: $(date)"

echo
echo "Total lines:"
wc -l < "$LOG_FILE"

echo
echo "ERROR count:"
grep -ic "error" "$LOG_FILE"

echo
echo "WARNING count:"
grep -ic "warning" "$LOG_FILE"

echo
echo "FAILED count:"
grep -ic "failed" "$LOG_FILE"

echo
echo "Recent critical messages:"
grep -inEi "error|warning|failed|critical|exception" "$LOG_FILE" | tail -20

echo
echo "======================================"
echo "Analysis completed"
echo "======================================"