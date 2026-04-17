#!/usr/bin/env bash
set -e

PKG="${1:-./...}"

echo "Running checks on $PKG..."

if command -v golangci-lint >/dev/null 2>&1; then
    echo "Running golangci-lint..."
    golangci-lint run "$PKG"
else
    echo "golangci-lint not installed, falling back to go vet..."
    go vet "$PKG"
fi

echo "Running go test with race detector..."
go test "$PKG" -race

echo "Checks completed successfully."
