#!/usr/bin/env bash
# Fail-closed environment check for Continuity mesh lane.
set -euo pipefail
NUMERAL="137451921129154222"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

fail() { echo "FAIL-CLOSED: $1" >&2; exit "${2:-1}"; }

[[ -f README.md ]] || fail "missing README.md" 2
grep -q "$NUMERAL" README.md || fail "numeral mismatch" 3
[[ -d ledger ]] || fail "missing ledger/" 5
[[ -d scripts ]] || fail "missing scripts/" 6

SHA="$(git rev-parse HEAD 2>/dev/null || true)"
[[ -n "$SHA" ]] || fail "empty SHA" 4

echo "env-check ok"
echo "numeral=$NUMERAL"
echo "sha=$SHA"
echo "readme_bytes=$(wc -c < README.md | tr -d ' ')"
