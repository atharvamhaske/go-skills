#!/usr/bin/env bash
set -e

if [ -f "go.mod" ]; then
    VERSION=$(grep "^go " go.mod | awk '{print $2}')
    if [ -n "$VERSION" ]; then
        echo "$VERSION"
        exit 0
    fi
fi

if command -v go >/dev/null 2>&1; then
    go version | awk '{print $3}' | sed 's/go//'
    exit 0
fi

echo "unknown"
exit 0
