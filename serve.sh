#!/usr/bin/env bash

# File watchers on WSL are not working corrently
# Force polling on WSL
if grep -q Microsoft /proc/version; then
    echo "WSL detected"
    bundle exec jekyll serve \
        --force_polling \
        --incremental \
        "$@"
else
    bundle exec jekyll serve \
        --incremental \
        "$@"
fi
