# Sanad HANDOFF

Shared state for every agent (Claude, Cursor, Codex, Copilot, Grok).
Do not trust chat memory. Read this file and `AGENTS.md` at session start.
Update this file only after the owner says `نفّذ`, and only the sections that changed.

Human note: هذا الملف ذاكرة المشروع بين الوكلاء. لا تحذفه.

## Current phase

**v0.1 package — public repo live, agent contracts in English, human docs Arabic-first.**

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
- `skills/fable/SKILL.md` English loader (does not ingest all of FABLE).
- `skills/app-security-gate` present with scanner script and Arabic user prompt.
- README shows profile avatar via `https://github.com/F-alsanea.png`.
- Language split decided: agent files English, human docs Arabic.

## Do not

- Do not merge AGENTS into FABLE or FABLE into AGENTS.
- Do not load all of FABLE for a copy/color change.
- Do not claim an app is secure unless the seven security gates are PASS with evidence.
- Do not put real API keys or `.env` values in this repository.
- Do not rewrite Git history unless the owner names the remote and says `نفّذ`.

## Open gaps

- `templates/AGENTS.md` is a pointer, not a full offline copy of root `AGENTS.md`.
- `skills/app-security-gate/references/gates.md` may be missing on GitHub; restore from the local kit if absent.
- No `v0.1.0` git tag yet.
- Repo description / topics on GitHub may still need a pass.
- This handoff file is new — agents after this commit must treat it as source of truth for "what happened".

## Verification state

- `✅ Confirmed`: `FABLE.md` on GitHub starts with FABLE 5.1 v2.3.0 and is the long constitution (~119KB).
- `✅ Confirmed`: root `AGENTS.md` is the English operating law.
- `⚠️ Code-confirmed`: security skill exists; some reference files were uploaded in shorter form than the local kit.
- `Not applicable`: app tests, deploy, database.

## How the next agent starts

1. Read `HANDOFF.md` then `AGENTS.md`.
2. Inspect the tree. Do not assume chat history.
3. Write a short session map.
4. Wait for `نفّذ` before any edit.
5. After an approved edit: update **Current phase**, **Done**, **Open gaps**, **Next action**, and the date below. Do not append a diary.

## Next action

Keep this file current after every approved change. Next product step, only if the owner asks: restore missing security-gate references from the local kit, then tag `v0.1.0`.

Last updated: 2026-09-06
Last writer: Grok (Sanad packaging session)
