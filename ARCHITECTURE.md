# Runtime architecture — Sanad

Sanad is the product name. FABLE is the constitution. AGENTS is the project law.
Two internal files. One job each.

Human docs (`README.md`, `docs/`) are Arabic-first.
Agent contracts (`FABLE.md`, `AGENTS.md`, `skills/*/SKILL.md`) are English.

```
User
   ↓
AGENTS.md          law of this project (thin, adapted)
   ↓ loads one layer only
FABLE.md           engineering standard (full, never loaded whole)
```

Do not merge them into one file. The merge recreates the 1500-line problem.

## Roles

| File | Place | Job |
|---|---|---|
| `FABLE.md` | package skill, or `skills/fable/SKILL.md` | how the model thinks as an engineer |
| `AGENTS.md` | root of every app repo | what is allowed in this project now |

FABLE = constitution.
AGENTS = municipal law.

## Session flow

1. The agent reads `AGENTS.md`.
2. It inspects the repository with no edits.
3. It classifies `NEW` or `EXISTING`.
4. If unclear, it asks one question.
5. It writes the session map and names the required FABLE layers.
6. It waits for `نفّذ` before any code.
7. It executes the smallest change, then evidence (`file:line` or command output).

## Who wins on conflict

1. The user's explicit order for this task.
2. `AGENTS.md`: scope, phases, approval, files, deferred infra.
3. FABLE is not waived on: fail-closed, zero placeholders, read-before-write, no claim without evidence.
4. The rest of FABLE only for surfaces this task touches.

AGENTS does not relax security.
FABLE does not widen project scope.

## When FABLE layers open

| Task | FABLE |
|---|---|
| Copy / color / class | Core only |
| Local behavior in an existing app | Light Layer R |
| UI / RTL | Section 2 |
| Public page | Section 3 |
| API / data / admin | Section 5.2 |
| New project or architecture change | Layer S before code |
| Delete / migration / push / secrets | Tier 3 + approval |

Opening more = waste.
Leaving a new project without Layer S = wasting the system.

## Do not

- Do not put AGENTS inside FABLE.
- Do not put all of FABLE inside AGENTS.
- Do not fork a FABLE per project type.
- Do not ask the user to read 1500 lines.

General rules live in FABLE.
Project rules live in AGENTS.
Runtime rules live in this file.
