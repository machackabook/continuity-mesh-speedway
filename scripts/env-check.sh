#!/usr/bin/env bash
set -euo pipefail
NUMERAL="137451921129154222"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
fail() { echo "env-check FAIL: $*"; exit 1; }
[ -f "$ROOT/README.md" ] || fail "missing README.md"
grep -q "$NUMERAL" "$ROOT/README.md" || fail "numeral mismatch in README"
[ -f "$ROOT/scripts/waterfall.sh" ] || fail "missing waterfall.sh"
grep -q "$NUMERAL" "$ROOT/scripts/waterfall.sh" || fail "numeral mismatch in waterfall"
[ -f "$ROOT/docs/LEDGER-STAMP.md" ] || fail "missing ledger stamp"
[ -d "$ROOT/.github/workflows" ] || fail "missing workflows dir"
[ -f "$ROOT/.github/workflows/cascade.yml" ] || fail "missing cascade.yml — do not invent extra YAML"
WF_COUNT=$(find "$ROOT/.github/workflows" -name '*.yml' -o -name '*.yaml' 2>/dev/null | wc -l | tr -d ' ')
[ "$WF_COUNT" -le 3 ] || echo "env-check WARN: workflow count=$WF_COUNT (prefer one healthy cascade)"
if command -v git >/dev/null 2>&1 && [ -d "$ROOT/.git" ]; then
  SHA=$(git -C "$ROOT" rev-parse HEAD 2>/dev/null || true)
  [ -n "${SHA:-}" ] || fail "empty SHA — point-zero null refused"
  echo "env-check SHA=$SHA"
fi
echo "env-check PASS numeral=$NUMERAL hop-surface=continuity-mesh-speedway hop=261"
