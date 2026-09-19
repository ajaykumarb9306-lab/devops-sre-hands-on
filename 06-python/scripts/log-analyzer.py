#!/usr/bin/env python3

import argparse
import os
import sys


def analyze_log(log_file):
    if not os.path.isfile(log_file):
        print(f"ERROR: File not found: {log_file}")
        return 1

    total_lines = 0
    errors = 0
    warnings = 0
    critical = 0
    failed = 0

    recent_issues = []

    with open(log_file, "r", errors="ignore") as file:
        for line_number, line in enumerate(file, start=1):
            total_lines += 1
            lower_line = line.lower()

            if "error" in lower_line:
                errors += 1

            if "warning" in lower_line or "warn" in lower_line:
                warnings += 1

            if "critical" in lower_line:
                critical += 1

            if "failed" in lower_line or "failure" in lower_line:
                failed += 1

            if any(
                word in lower_line
                for word in ["error", "critical", "failed", "failure"]
            ):
                recent_issues.append(
                    f"{line_number}: {line.strip()}"
                )

    print("=" * 60)
    print("LOG ANALYSIS REPORT")
    print("=" * 60)

    print(f"File: {log_file}")
    print(f"Total lines: {total_lines}")
    print(f"Errors: {errors}")
    print(f"Warnings: {warnings}")
    print(f"Critical: {critical}")
    print(f"Failed/Failure: {failed}")

    print("\nRecent Issues")

    for issue in recent_issues[-10:]:
        print(issue)

    return 0


def main():
    parser = argparse.ArgumentParser(
        description="Analyze a log file for common failure keywords"
    )

    parser.add_argument(
        "log_file",
        help="Path to log file"
    )

    args = parser.parse_args()

    return analyze_log(args.log_file)


if __name__ == "__main__":
    sys.exit(main())