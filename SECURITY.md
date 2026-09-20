# Security posture

- No secrets, tokens, cookies, private keys, or enclave material in this tree.
- `CASCADE_TOKEN` and Drive credentials live in GitHub Actions secrets or device environment only.
- Skeptical of network devices: catalog first, verify source, then act.
- Public projections must remain clean.
- DIVERGED is a review state. No force-reset.
- Report issues privately to the architect (`machackabook`) before public disclosure if the issue involves credentials.
- Hourly cascade must never print secrets. Workflow uses `env` from Actions secrets only.

Numeral 137451921129154222. Source code is the only trusted neighbor.
