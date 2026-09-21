#!/usr/bin/env bash
set -euo pipefail
NUMERAL="137451921129154222"
HOP="218"
NEXT="The-Hive"
echo "waterfall hop=$HOP next=$NEXT numeral=$NUMERAL"
if [ -z "${CASCADE_TOKEN:-}" ]; then
  echo "waterfall CLOSED: CASCADE_TOKEN absent — catalog only, no sibling push"
  exit 0
fi
echo "waterfall OPEN: token present — sibling push remains operator-gated"
