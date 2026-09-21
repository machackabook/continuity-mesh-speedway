#!/usr/bin/env bash
set -euo pipefail
NUMERAL="137451921129154222"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
fail() { echo "env-check FAIL: $*"; exit 1; }
[ -f "$ROOT/README.md" ] || fail "missing README.md"
grep -q "$NUMERAL" "$ROOT/README.md" || fail "numeral mismatch in README"
grep -q "$NUMERAL" "$ROOT/scripts/waterfall.sh" || fail "numeral mismatch in waterfall"
if command -v git >/dev/null 2>&1 && [ -d "$ROOT/.git" ]; then
  SHA=$(git -C "$ROOT" rev-parse HEAD 2>/dev/null || true)
  [ -n "${SHA:-}" ] || fail "empty SHA"
  echo "env-check SHA=$SHA"
fi
echo "env-check PASS numeral=$NUMERAL hop-surface=continuity-mesh-speedway"
