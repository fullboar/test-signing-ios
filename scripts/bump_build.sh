#!/bin/sh
set -xaou pipefail

/usr/libexec/PlistBuddy \
-c "Set :CFBundleVersion ${GITHUB_RUN_ID}" "$1"
