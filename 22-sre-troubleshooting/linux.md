# Linux Troubleshooting

## CPU

top

ps aux --sort=-%cpu | head

## Memory

free -h

ps aux --sort=-%mem | head

## Disk

df -h

du -sh *

## Processes

ps aux

pgrep PROCESS_NAME

## Listening Ports

ss -lntp

## Logs

journalctl -xe

journalctl -u SERVICE_NAME

tail -f /var/log/syslog

## Load

uptime

## Troubleshooting Flow

High CPU
   |
Identify process
   |
Check application
   |
Check traffic
   |
Check recent changes

Disk Full
   |
df -h
   |
Identify filesystem
   |
du
   |
Find large files/logs
