#!/bin/bash

set -u

echo "======================================"
echo "SERVER HEALTH REPORT"
echo "======================================"

echo "Date       : $(date)"
echo "Hostname   : $(hostname)"
echo "Uptime     : $(uptime -p 2>/dev/null || uptime)"

echo
echo "---------- MEMORY ----------"
free -h

echo
echo "---------- DISK ------------"
df -h

echo
echo "---------- LOAD ------------"
uptime

echo
echo "---------- TOP CPU ----------"
ps aux --sort=-%cpu | head -6

echo
echo "---------- TOP MEMORY -------"
ps aux --sort=-%mem | head -6

echo
echo "---------- FAILED SERVICES --"
systemctl --failed --no-pager 2>/dev/null || true

echo
echo "---------- LISTENING PORTS --"
ss -lntp 2>/dev/null || true

echo
echo "======================================"
echo "REPORT COMPLETED"
echo "======================================"