#!/bin/zsh
set -eu
cd "${0:A:h}"
TASK_TEST_DIR=$(mktemp -d)
trap 'rm -rf "$TASK_TEST_DIR"' EXIT
swiftc -swift-version 5 -sanitize=address Sources/PaneFeatures.swift Sources/RequestErrors.swift Tests/PolicyTests.swift -o "$TASK_TEST_DIR/PolicyTests"
"$TASK_TEST_DIR/PolicyTests"
