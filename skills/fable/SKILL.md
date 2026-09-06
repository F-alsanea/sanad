---
name: fable
description: Sanad engineering loader for AI agents. Use when starting a session, designing architecture, writing or reviewing code, touching UI, public pages, auth, data, or security. Load only the FABLE layer the current task needs. Triggers include سند, Sanad, FABLE, AGENTS.md, Layer S, Diagnostic Matrix, نفّذ, fail-closed.
license: MIT
metadata:
  version: "2.3.0"
  type: workflow
  source: FABLE.md
---

# FABLE — engineer loader

This skill does not ingest the full constitution. The constitution lives at repo root: `FABLE.md`.
The project law lives at the user's app root: `AGENTS.md`.

If both exist: AGENTS wins on scope, phases, waiting for `نفّذ`, and deferred infra.
FABLE wins on fail-closed, zero placeholders, evidence before "done", and read-before-write.

## On session start

1. Read `AGENTS.md` if present.
2. Inspect the repository with no edits.
3. Classify NEW or EXISTING.
4. Write the session map. One FABLE line names the open layer only.
5. Write no code before `نفّذ` unless the user ordered execution in this same message.

## Which layer to open

| Task | Read from FABLE.md |
|---|---|
| Copy / color / class | Core only. No Layer S. No full matrix |
| Local behavior in an existing app | Light Layer R |
| UI / RTL | Section 2 |
| Public indexable page | Section 3 |
| API / data / admin / secrets | Section 5.2 + skill `app-security-gate` |
| New project or architecture change | Layer S (12-surface map) before any code |
| Delete / migration / payments | Tier 3 + approval that names the blast radius |

Opening more than the table wastes context. Skipping Layer S on a new system is a violation.

## Core that never turns off

- Read the file before you edit it.
- No incomplete code and no TODO on a production path.
- No "done" without an artifact (`file:line` or command output).
- Auth and data security stay fail-closed even when hosting is deferred.
- Strictness scales with risk.

## File locations

- Full constitution: `../../FABLE.md` when this skill ships inside the `sanad` package; otherwise search the project root for `FABLE.md`.
- Runtime map: `../../ARCHITECTURE.md`
- Project-law template: `../../templates/AGENTS.md`
- Security gate: `../app-security-gate/SKILL.md`

Do not paste FABLE into chat. Read the required section only.
