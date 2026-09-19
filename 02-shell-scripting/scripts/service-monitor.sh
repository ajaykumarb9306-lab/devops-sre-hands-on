#!/bin/bash

SERVICE=${1:-}

if [ -z "$SERVICE" ]; then
    echo "Usage: $0 <service-name>"
    exit 1
fi

echo "Checking service: $SERVICE"

if systemctl is-active --quiet "$SERVICE"; then
    echo "OK: $SERVICE is running"
    exit 0
else
    echo "CRITICAL: $SERVICE is not running"

    echo
    echo "Service status:"
    systemctl status "$SERVICE" --no-pager

    echo
    echo "Recent logs:"
    journalctl -u "$SERVICE" -n 20 --no-pager

    exit 1
fi