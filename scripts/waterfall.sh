#!/usr/bin/env bash
# Continuity waterfall hop helper. One sibling. No force. No secrets in tree.
set -euo pipefail
NUMERAL="137451921129154222"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if [[ ! -f README.md ]]; then
  echo "FAIL-CLOSED: missing README.md" >&2
  exit 2
fi
if ! grep -q "$NUMERAL" README.md; then
  echo "FAIL-CLOSED: numeral mismatch" >&2
  exit 3
fi

SHA="$(git rev-parse HEAD 2>/dev/null || true)"
if [[ -z "${SHA}" ]]; then
  echo "FAIL-CLOSED: empty SHA" >&2
  exit 4
fi

echo "waterfall ok"
echo "numeral=$NUMERAL"
echo "sha=$SHA"
echo "next=The-Hive"
echo "token_present=${CASCADE_TOKEN:+yes}"
echo "token_present=${CASCADE_TOKEN:-no}"
