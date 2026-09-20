#!/usr/bin/env python3

import argparse
import sys
import time

import requests


def check_url(url, timeout):
    start = time.time()

    try:
        response = requests.get(
            url,
            timeout=timeout
        )

        response_time = round(time.time() - start, 3)

        print(f"URL: {url}")
        print(f"HTTP Status: {response.status_code}")
        print(f"Response Time: {response_time}s")

        if response.ok:
            print("Status: HEALTHY")
            return 0

        print("Status: UNHEALTHY")
        return 1

    except requests.RequestException as error:
        print(f"Status: UNHEALTHY")
        print(f"Error: {error}")
        return 1


def main():
    parser = argparse.ArgumentParser(
        description="Check HTTP endpoint health"
    )

    parser.add_argument(
        "url",
        help="URL to check"
    )

    parser.add_argument(
        "--timeout",
        type=int,
        default=10,
        help="Request timeout in seconds"
    )

    args = parser.parse_args()

    return check_url(
        args.url,
        args.timeout
    )


if __name__ == "__main__":
    sys.exit(main())