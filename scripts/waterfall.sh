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
DRIVE_MIRRORS=(
  "1Vxoz5vYOR-unhvLNK_bz4fFl3lT4W3Ns"
  "1FfZuLbRRDNSnw2qxSayebL2KIrYmiS1H"
  "1jzHTkjtZhjrAOkQKsHEvc2Rf7237o_wA"
)
echo "waterfall numeral=$NUMERAL siblings=${#SIBLINGS[@]} drive_mirrors=${#DRIVE_MIRRORS[@]}"
for s in "${SIBLINGS[@]}"; do
  echo "  - $s"
done
echo "drive mirrors (catalog only; no write from CI):"
for d in "${DRIVE_MIRRORS[@]}"; do
  echo "  - CONTINUUM-GITHUB-MESH $d"
done
if [ -z "${CASCADE_TOKEN:-}" ]; then
  echo "CASCADE_TOKEN absent — sibling push closed (skepticism)."
  exit 0
fi
echo "CASCADE_TOKEN present — operator must still hop one repo per hour."
