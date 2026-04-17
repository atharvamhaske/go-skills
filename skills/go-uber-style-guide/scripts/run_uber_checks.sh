#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<USAGE
Usage: scripts/run_uber_checks.sh [--fix] [package-pattern]

Examples:
  scripts/run_uber_checks.sh
  scripts/run_uber_checks.sh ./...
  scripts/run_uber_checks.sh --fix ./internal/...
USAGE
}

fix=false
pkg="./..."

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  usage
  exit 0
fi

if [ "${1:-}" = "--fix" ]; then
  fix=true
  shift
fi

if [ "${1:-}" != "" ]; then
  pkg="$1"
fi

if ! go list "$pkg" >/dev/null 2>&1; then
  echo "go list failed for package pattern: $pkg"
  echo "Run this script from a Go module root or pass a valid package pattern."
  exit 1
fi

if [ "$fix" = true ]; then
  if command -v goimports >/dev/null 2>&1; then
    echo "Running goimports -w on workspace Go files"
    # Keep this repo-friendly: format existing files, skip vendor.
    find . -type f -name '*.go' -not -path './vendor/*' -print0 | xargs -0 goimports -w
  else
    echo "goimports not found; skipping --fix formatting step"
  fi
fi

if command -v golangci-lint >/dev/null 2>&1; then
  echo "Running golangci-lint"
  golangci-lint run "$pkg"
  exit 0
fi

echo "golangci-lint not found; running available Uber baseline linters"

if command -v errcheck >/dev/null 2>&1; then
  errcheck "$pkg"
else
  echo "errcheck not found; skipping"
fi

if command -v revive >/dev/null 2>&1; then
  revive "$pkg"
else
  echo "revive not found; skipping"
fi

if command -v staticcheck >/dev/null 2>&1; then
  staticcheck "$pkg"
else
  echo "staticcheck not found; skipping"
fi

go vet "$pkg"
