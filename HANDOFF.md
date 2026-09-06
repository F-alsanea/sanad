# Sanad HANDOFF

Shared state for every agent (Claude, Cursor, Codex, Copilot, Grok).
Do not trust chat memory. Read this file and `AGENTS.md` at session start.
Update this file only after the owner says `نفّذ`, and only the sections that changed.

Human note: هذا الملف ذاكرة المشروع بين الوكلاء. لا تحذفه.

## Current phase

**v0.1 package — second Claude review closed: §10.1 on fable skill + ARCHITECTURE; G4/G6 PASS needs exercised deny path.**

## Repository baseline

- Product name: Sanad / سند
- Repository: `F-alsanea/sanad` (public, MIT)
- Owner: Faisal Alsanea (`F-alsanea`)
- Branch: `main`
- Constitution: `FABLE.md` (FABLE 5.1, v2.3.0) — English, load one layer
- Project law: `AGENTS.md` — English machine contract; approval token stays `نفّذ`
- Skills: `skills/fable`, `skills/app-security-gate`
- Human docs: `README.md`, `docs/` — Arabic first
- Application runtime: none (this repo is files for agents, not an app)
- Secrets / hosting / database: none in this repo, by design

## Done

- Public repo created and branded Sanad.
- Full `FABLE.md` on `main`.
- `AGENTS.md` converted to English; `نفّذ` kept as the mutation token.
- `skills/fable/SKILL.md` English loader; table includes Section 10.1.
- `ARCHITECTURE.md` layer table includes Section 10.1.
- `skills/app-security-gate` + `references/gates.md`.
- G4/G6 `PASS` requires an exercised deny path; code-only read is `UNVERIFIED`.
- Orphan `AGENTS-template.md` removed. `templates/AGENTS.md` is a full English copy.
- Language split: agent files English, human docs Arabic.
- Read-only `scan-secrets.sh` does not wait for `نفّذ`.

## Do not

- Do not merge AGENTS into FABLE or FABLE into AGENTS.
- Do not load all of FABLE for a copy/color change.
- Do not claim an app is secure unless the seven security gates are PASS with evidence.
- Do not give G4 or G6 PASS from `file:line` alone.
- Do not put real API keys or `.env` values in this repository.
- Do not rewrite Git history unless the owner names the remote and says `نفّذ`.
- Do not recreate `AGENTS-template.md` in Arabic.

## Open gaps

- No `v0.1.0` git tag yet.
- Repo description / topics on GitHub may still need a pass.
- Precedence text is still restated in AGENTS, FABLE, ARCHITECTURE, and `skills/fable` — keep them aligned when one changes. §10.1 lookup is now in all four layer tables.

## Verification state

- `✅ Confirmed`: `FABLE.md` on GitHub starts with FABLE 5.1 v2.3.0 (~119KB).
- `✅ Confirmed`: root `AGENTS.md` is the English operating law.
- `✅ Confirmed`: `references/gates.md` exists; evidence bar for G4/G6 written.
- `✅ Confirmed`: fable skill + ARCHITECTURE name Section 10.1.
- `Not applicable`: app tests, deploy, database.

## How the next agent starts

1. Read `HANDOFF.md` then `AGENTS.md`.
2. Inspect the tree. Do not assume chat history.
3. Write a short session map.
4. Wait for `نفّذ` before any edit.
5. After an approved edit: update **Current phase**, **Done**, **Open gaps**, **Next action**, and the date below. Do not append a diary.

## Next action

Keep this file current after every approved change. Next product step, only if the owner asks: tag `v0.1.0`.

Last updated: 2026-09-06
Last writer: Grok (second Claude-review close)
