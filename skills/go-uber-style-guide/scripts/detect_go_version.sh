#!/usr/bin/env bash
set -euo pipefail

# Print the most common Go version declared in go.mod files.
# Prints "unknown" when no go.mod with a version line is found.

versions=""

if command -v rg >/dev/null 2>&1; then
  versions="$(rg --no-heading --glob '**/go.mod' '^go [0-9]+\.[0-9]+(\.[0-9]+)?$' . -r '$0' 2>/dev/null | awk '{print $2}' || true)"
else
  versions="$(find . -name go.mod -type f -print0 2>/dev/null | xargs -0 awk '/^go [0-9]+\.[0-9]+(\.[0-9]+)?$/ {print $2}' 2>/dev/null || true)"
fi

if [ -z "${versions}" ]; then
  echo "unknown"
  exit 0
fi

printf '%s\n' "${versions}" | awk 'NF' | sort | uniq -c | sort -nr | awk 'NR==1{print $2}'
