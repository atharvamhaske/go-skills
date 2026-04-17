#!/usr/bin/env bash
set -e

# Run standard Go formatting and vet checks as baseline
echo "Running go fmt..."
go fmt ./...

echo "Running go vet..."
go vet ./...

if command -v golangci-lint >/dev/null 2>&1; then
    echo "Running golangci-lint..."
    golangci-lint run ./...
else
    echo "golangci-lint not installed, skipping advanced linting."
fi

echo "Checks completed successfully."
