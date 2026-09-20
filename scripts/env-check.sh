#!/usr/bin/env bash
set -euo pipefail
NUMERAL="137451921129154222"
fail() { echo "env-check FAIL: $*"; exit 1; }
[ -f README.md ] || fail "missing README.md"
grep -q "$NUMERAL" README.md || fail "numeral not present in README"
if command -v git >/dev/null 2>&1; then
  sha=$(git rev-parse HEAD 2>/dev/null || true)
  [ -n "${sha:-}" ] || fail "empty SHA / point-zero null"
fi
echo "env-check OK numeral=$NUMERAL"
