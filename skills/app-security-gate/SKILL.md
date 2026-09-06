---
name: app-security-gate
description: Fail-closed security audit and hardening for apps. Use when the user asks to hide API keys, strip secrets from git history, expose only the public database key, enable row-level security, encrypt sensitive data, enforce server-side auth, secure logs, or run a pre-ship security review. Triggers include أمان, اختراق, RLS, secrets, API keys, security audit, تحقق من الأمان, hardening.
license: MIT
metadata:
  version: "1.0.0"
  type: workflow
  fable_layer: Security
  risk_tier: "3"
---

# App Security Gate

Fail-closed pre-ship gate. Do not trust a hidden UI or a key "hidden in the frontend". Never print a secret value.

FABLE layer: Security (Section 5.2). Risk tier: 3.
If `AGENTS.md` exists: report, then wait for `نفّذ`. Touch no file before approval unless the user ordered execution in this same message.

Read on demand:
- `references/gates.md` — seven gates plus attack expansion
- `references/stack-adapters.md` — where to look by framework
- `assets/report-template.md` — report shape
- `scripts/scan-secrets.sh` — pattern scan that redacts values
- `assets/user-prompt-ar.md` — Arabic paste prompt for humans

## Absolute rules

1. Never print a secret. Path + kind + line numbers only.
2. Do not edit before the report unless the user said `نفّذ`.
3. Do not soften a verdict. An auth library is not authentication. RLS on one table is not isolation. `noindex` is not access control.
4. The client is untrusted. Money, role, price, or row ownership is re-derived on the server.
5. Fail-closed. Missing session or failed verification = deny.
6. Do not pick an infra vendor if AGENTS marks infra deferred.
7. Git history is not the working tree. Inspect both.
8. Only public-by-design keys belong on the client. `service_role` on a client = Critical.

## Seven gates

G1 hide API keys | G2 secrets out of Git | G3 public DB key only | G4 RLS | G5 encrypt sensitive data | G6 server-side auth | G7 secure logs.

Details: `references/gates.md`. Report: `assets/report-template.md`.

Do not say the app is secure unless all seven gates are PASS with evidence.
