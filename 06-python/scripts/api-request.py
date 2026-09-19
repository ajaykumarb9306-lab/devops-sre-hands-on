#!/usr/bin/env python3

import argparse
import json
import os
import sys

import requests


def main():
    parser = argparse.ArgumentParser(
        description="Send a GET request to a REST API"
    )

    parser.add_argument(
        "url",
        help="API endpoint"
    )

    parser.add_argument(
        "--token",
        action="store_true",
        help="Use API_TOKEN environment variable"
    )

    args = parser.parse_args()

    headers = {
        "Accept": "application/json"
    }

    if args.token:
        token = os.getenv("API_TOKEN")

        if not token:
            print("ERROR: API_TOKEN environment variable is not set")
            return 1

        headers["Authorization"] = f"Bearer {token}"

    try:
        response = requests.get(
            args.url,
            headers=headers,
            timeout=10
        )

        print(f"HTTP Status: {response.status_code}")

        response.raise_for_status()

        try:
            data = response.json()
            print(json.dumps(data, indent=4))

        except requests.exceptions.JSONDecodeError:
            print(response.text)

        return 0

    except requests.RequestException as error:
        print(f"ERROR: API request failed: {error}")
        return 1


if __name__ == "__main__":
    sys.exit(main())

    