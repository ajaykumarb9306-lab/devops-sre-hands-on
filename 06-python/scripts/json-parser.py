#!/usr/bin/env python3

import argparse
import json
import sys


def load_json(file_path):
    try:
        with open(file_path, "r") as file:
            return json.load(file)

    except FileNotFoundError:
        print(f"ERROR: File not found: {file_path}")
        sys.exit(1)

    except json.JSONDecodeError as error:
        print(f"ERROR: Invalid JSON: {error}")
        sys.exit(1)


def main():
    parser = argparse.ArgumentParser(
        description="Read and display JSON files"
    )

    parser.add_argument(
        "file",
        help="JSON file to read"
    )

    args = parser.parse_args()

    data = load_json(args.file)

    print(json.dumps(data, indent=4))

#Quick Examople
if __name__ == "__main__":
    main()


    cat > /tmp/servers.json <<'EOF'
{
  "environment": "production",
  "servers": [
    {
      "name": "web01",
      "ip": "10.0.1.10"
    },
    {
      "name": "web02",
      "ip": "10.0.1.11"
    }
  ]
}
EOF