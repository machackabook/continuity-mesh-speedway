#!/usr/bin/env bash
# Dry-run zip overwatch. Never extract operator archives in CI.
set -euo pipefail
TARGET="${1:-.}"
echo "[zip-watch] scan ${TARGET} (list only)"
find "${TARGET}" -type f -iname '*.zip' 2>/dev/null | while read -r z; do
  echo "--- ${z}"
  unzip -l "${z}" | head -n 40 || echo "unreadable"
done
echo "[zip-watch] done. extract is operator-local only."
