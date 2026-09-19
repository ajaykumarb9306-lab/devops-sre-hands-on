#!/usr/bin/env python3

import platform
import socket

import psutil


def bytes_to_gb(value):
    return round(value / (1024 ** 3), 2)


def main():
    print("=" * 50)
    print("SYSTEM HEALTH REPORT")
    print("=" * 50)

    print(f"Hostname: {socket.gethostname()}")
    print(f"OS: {platform.system()} {platform.release()}")

    print("\nCPU")
    cpu = psutil.cpu_percent(interval=1)
    print(f"Usage: {cpu}%")

    print("\nMEMORY")
    memory = psutil.virtual_memory()

    print(f"Total: {bytes_to_gb(memory.total)} GB")
    print(f"Available: {bytes_to_gb(memory.available)} GB")
    print(f"Usage: {memory.percent}%")

    print("\nDISK")

    disk = psutil.disk_usage("/")

    print(f"Total: {bytes_to_gb(disk.total)} GB")
    print(f"Free: {bytes_to_gb(disk.free)} GB")
    print(f"Usage: {disk.percent}%")

    print("\nSTATUS")

    if cpu >= 80:
        print(f"WARNING: CPU usage is {cpu}%")

    if memory.percent >= 80:
        print(f"WARNING: Memory usage is {memory.percent}%")

    if disk.percent >= 80:
        print(f"WARNING: Disk usage is {disk.percent}%")

    print("=" * 50)


if __name__ == "__main__":
    main()