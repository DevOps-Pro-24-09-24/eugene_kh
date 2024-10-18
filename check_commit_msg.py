#!/bin/bash

COMMIT_MSG_FILE="$1"
COMMIT_MSG=$(cat "$COMMIT_MSG_FILE")

PATTERN="^DJ-[0-9]+:.*$"

if [[ ! $COMMIT_MSG =~ $PATTERN ]]; then
    echo "ERROR: Commit message must follow the pattern 'DJ-XXXXXX:AAAAA', where XXXXXX some numbers and AAAA any english letters"
    exit 1
fi
