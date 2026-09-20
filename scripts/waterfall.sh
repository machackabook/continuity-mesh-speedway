#!/usr/bin/env bash
# Documented hop order. Does not push siblings unless CASCADE_TOKEN is set.
set -euo pipefail
NUMERAL="137451921129154222"
SIBLINGS=(
  "ENCLAVE-ADAM-REUNITED"
  "Cryptic-Heartbeat"
  "The-Hive"
  "continuity-ledger-cycle"
  "gaia-visualizer"
  "nexus-repo-sync"
  "sovereign-ai-factory-ai-polyglot"
  "continuity-mesh-speedway"
)
echo "waterfall numeral=$NUMERAL siblings=${#SIBLINGS[@]}"
for s in "${SIBLINGS[@]}"; do
  echo "  - $s"
done
if [ -z "${CASCADE_TOKEN:-}" ]; then
  echo "CASCADE_TOKEN absent — sibling push closed (skepticism)."
  exit 0
fi
echo "CASCADE_TOKEN present — operator must still hop one repo per hour."
