#!/bin/bash

echo "================================="
echo "      SYSTEM HEALTH CHECK"
echo "================================="

echo
echo "Hostname:"
hostname

echo
echo "Uptime:"
uptime

echo
echo "Memory Usage:"
free -h

echo
echo "Disk Usage:"
df -h

echo
echo "Top CPU Processes:"
ps aux --sort=-%cpu | head -6

echo
echo "Top Memory Processes:"
ps aux --sort=-%mem | head -6

echo
echo "Listening Ports:"
ss -lntp

echo
echo "================================="
echo "Health check completed: $(date)"
echo "================================="