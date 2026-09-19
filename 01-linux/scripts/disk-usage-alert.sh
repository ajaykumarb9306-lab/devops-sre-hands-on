#!/bin/bash

THRESHOLD=80

df -P | awk 'NR>1 {print $5, $6}' | while read usage filesystem
do
    usage=${usage%\%}

    if [ "$usage" -ge "$THRESHOLD" ]; then
        echo "WARNING: $filesystem is ${usage}% full"
    fi
done