#!/usr/bin/env bash
# Continuity waterfall — pull then optional sibling dispatch.
# Secrets never live in this file.
set -euo pipefail
NUMERAL="137451921129154222"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
echo "[waterfall] numeral ${NUMERAL} root ${ROOT}"

stamp() {
  mkdir -p "${ROOT}/ledger"
  local f="${ROOT}/ledger/WATERFALL-$(date -u +%Y%m%dT%H%M%SZ).md"
  {
    echo "# waterfall stamp"
    echo "- utc: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "- numeral: ${NUMERAL}"
    echo "- host: $(hostname 2>/dev/null || echo unknown)"
    echo "- git: $(git -C "${ROOT}" rev-parse --short HEAD 2>/dev/null || echo detached)"
  } > "${f}"
  echo "[waterfall] wrote ${f}"
}

stamp

SIBLINGS=(
  machackabook/tdoc-ledgertrove
  machackabook/hamiltonian-incursion
  machackabook/TheLedgerIndex
  machackabook/The-Hive
  machackabook/Cryptic-Heartbeat
  machackabook/gaia-visualizer
)

if [[ -z "${CASCADE_TOKEN:-}" ]]; then
  echo "[waterfall] CASCADE_TOKEN unset — stamp only, no remote dispatch"
  exit 0
fi

for repo in "${SIBLINGS[@]}"; do
  echo "[waterfall] dispatch ${repo}"
  gh workflow run continuity-hourly.yml --repo "${repo}" || \
    gh workflow run enhance.yml --repo "${repo}" || \
    echo "[waterfall] no hourly workflow on ${repo} — skipped"
done
