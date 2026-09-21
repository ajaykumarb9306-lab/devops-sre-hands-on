#!/bin/bash

set -euo pipefail

TARGET="${1:-.}"

echo "Scanning: $TARGET"
echo

PATTERNS=(
  'password[[:space:]]*='
  'api[_-]?key[[:space:]]*='
  'secret[[:space:]]*='
  'token[[:space:]]*='
  'BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY'
)

FOUND=0

for pattern in "${PATTERNS[@]}"; do
  if grep -RniE \
    --exclude='secret-scan.sh' \
    --exclude-dir='.git' \
    -- "$pattern" "$TARGET"; then
    FOUND=1
  fi
done

echo

if [ "$FOUND" -eq 1 ]; then
  echo "Potential secret detected."
  exit 1
else
  echo "No matching secret patterns detected."
fi
