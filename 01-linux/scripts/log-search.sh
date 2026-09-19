#!/bin/bash

LOG_FILE=$1
SEARCH_TERM=$2

if [ -z "$LOG_FILE" ] || [ -z "$SEARCH_TERM" ]; then
    echo "Usage: $0 <log-file> <search-term>"
    exit 1
fi

grep -in "$SEARCH_TERM" "$LOG_FILE"