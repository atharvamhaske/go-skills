#!/usr/bin/env bash
set -euo pipefail

pkg="${1:-./...}"

if ! go list "$pkg" >/dev/null 2>&1; then
  echo "go list failed for package pattern: $pkg"
  echo "Run from Go module root or pass a valid package pattern."
  exit 1
fi

if command -v golangci-lint >/dev/null 2>&1; then
  golangci-lint run "$pkg"
else
  go vet "$pkg"
fi

go test "$pkg" -race
