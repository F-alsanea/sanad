<!--
Sanad app template. Copy this file to your app root as AGENTS.md.
Do not overwrite a project-specific AGENTS.md.
Sanad itself uses /AGENTS.md as the source of truth. Keep this file in sync when the root contract changes.
-->

# AGENTS.md — operating law for this repository

> Binding on every coding agent working here (Claude, Codex, Cursor, Copilot, Grok, Gemini, others).
> Read this file in full at the start of every session, before any inspection or edit.

Human-facing docs for Sanad are Arabic-first in `README.md`. This file is English on purpose: it is the machine contract.

## Precedence

When this file conflicts with a general skill (including FABLE) or saved instructions:
the governing rules and verification protocol in **this file** win.

If a conflict would block the task, stop and ask the user. Do not improvise a compromise.

Relationship with FABLE:

This file runs the project. FABLE supplies engineering force. Do not paste FABLE prose into this file.

- This file wins on: scope, phase order, waiting for `نفّذ`, allowed files, deferred infrastructure.
- FABLE wins on: fail-closed, zero placeholders, evidence before "done", read-before-write, risk tiers.
- Risk tiers 0–3 are defined only in **FABLE Section 10.1**. Do not invent a private scale. If that section is not loaded, mark the tier `unconfirmed`.
- If a FABLE skill or `FABLE.md` is present, load **only the section the task needs**. If it is not loaded, apply the compact core below. Do not drop quality because the long file is closed.

### FABLE core — always on

- Read a file before you edit it.
- No code before the report and approval, unless the user said `نفّذ` (or "execute") on a clear request in this message.
- No TODO / stub / fake data in place of required logic.
- Do not claim verification without an artifact (`file:line` or command output).
- Auth and data security stay fail-closed even when infrastructure is deferred.

### When to pull full FABLE

| Task | Open from FABLE |
|---|---|
| Copy / color / class | Core only. No full matrix. No Layer S |
| Existing repo + local behavior | Light Layer R + surgical edit |
| UI / RTL / layout | Section 2 only when the surface is touched |
| Public indexable page | Section 3 (SEO / AEO / GEO) |
| API / data / auth / admin | Section 5.2 in full |
| New project or architecture change | Layer S (12-surface map) before any code |
| Classify risk / choose ritual | Section 10.1 — do not guess the tier |
| Delete / migration / payments / secrets | Tier 3: named approval + rollback plan |

Write one session-map line: `FABLE: [core | R | S | UI | Visibility | Security]`.
Opening more than the table wastes context. Skipping Security or skipping Layer S on a new system wastes FABLE.

### Context budget — FABLE Section 4, in force even if the long file is closed

Tokens are a budget. Do not spend them re-reading or reprinting unchanged text.

- Read a whole file only if it is short or the task is a rewrite of that file. Otherwise: find the symbol, then read the span plus margin.
- Do not re-read a file that was not edited in this task.
- Do not print a file after writing it. Path + what changed is enough.
- Do not reprint untouched code, or the matrix / map after it was written once.
- Do not dump a tree deeper than two levels. Use directed search.
- Do not paste uncut install, test, or log output. Tail or error only.
- Read independent files in parallel.
- Update the session map; do not stack copies. Length stays roughly fixed.
- After execution: before/after for the changed span only + short evidence. No epic report.
- Loading all of FABLE for a cosmetic task is forbidden. Open the needed section only.

---

## Session intake — discover, ask, adapt

Do not wait for a filled table. Do not assume the project is new. Inspect the repo first.

### 1) Read reality

In the first reply after reading this file, inspect for real (no edits):
root, packages, `app`/`src`/`cmd`, pages, admin, API, `.env.example`, Docker/CI, domain in config, README.

### 2) Classify the project

- **EXISTING** — real code, routes, or a prior delivery. Default: do not break what works. Full Layer S only if the task changes architecture.
- **NEW** — empty or scaffold only. Default: ask before building. Layer S is mandatory before any code.

If classification is unclear, ask one question:
`Is this an existing project we patch, or a new project we start?`

### 3) Ask only what files cannot show

Do not ask about a stack visible in `package.json` or equivalent.
Ask one missing item at a time, in this order:
1. New vs existing (if still unclear)
2. Domain / audience if texts do not show it
3. Language and direction if `lang`/`dir`/copy do not show it
4. Hosting / domain / database: decided or deferred
5. Whether admin, payments, or sensitive user data exist

### 4) Write the session map, then stop

Before any code:

```
SESSION
- project: NEW / EXISTING
- stack (observed):
- what already works:
- current task:
- FABLE layers required:
- deferred:
- open question (one or zero):
```

Then wait for approval or `نفّذ`.

### 5) Adapt

- EXISTING + small edit: AGENTS + the smallest FABLE layer. No redesign.
- EXISTING + security/data fix: full fail-closed. Do not touch visuals.
- NEW: Layer S before code. If infra is undecided, treat it as deferred and ask.
- Do not invent the project table. Fill it from inspection. A missing row stays a question.

## Project facts (from inspection, never from imagination)

- **Type:** NEW / EXISTING
- **Repo / branch:**
- **Stack / folders:**
- **Language and direction:**
- **Domain and scope:**
- **Surfaces:** public UI / admin / API
- **Hosting:** decided / deferred
- **Domain:** wired / deferred
- **Database / backend:** decided / deferred
- **Secrets:** where they are read, and what must never be printed

**Role:** senior engineer. Existing = do not break. New = do not build before asking.

---

## Deferred infrastructure

If hosting, domain, or database is **deferred**:

- Do not pick or wire a vendor, add its SDK, or create deploy files unless explicitly ordered.
- Do not assume a vendor.
- Do not replace static / mock / hardcoded data. Record it in `INFRA-TODO.md` with file and line.
- Application security is not deferred: input checks, authz, layering, no exposed secrets.
- Do not start deploy until the user says, literally: `ابدأ مرحلة البنية التحتية` or `start infrastructure`.
- Then ask for vendor, data plan, and domain. Do not choose for them.

If infra is decided, delete this section and replace it with the real vendor constraints.

---

## Governing rules (non-negotiable)

1. Do not rewrite a whole file. Change the minimum.
2. Do not edit a file that was not named or approved.
3. Do not change final visuals (colors, fonts, spacing, classes/IDs, order, user-visible copy) unless that *is* the fix, and the user was told.
4. Do not delete a feature, file, or comment. Uncertain items go to a "needs confirm" list.
5. Do not add, upgrade, or remove a library without explicit permission.
6. Do not assume. Missing = ask.
7. One phase per reply, then stop and wait.
8. In every phase: report first (problem / file / line / severity / fix). No **write** until the user says `نفّذ`.
9. After execution: touched files + before/after + one manual test.
10. Any fix that can change behavior = label it `behavioral change` + the lower-risk alternative.
11. Do not trust session memory for repo state. Re-read files before any claim.
12. Strictness scales with risk. Tiers live in FABLE Section 10.1. A cosmetic edit does not get a full-system ritual. Security, data, and public surfaces are never relaxed.

### `نفّذ` vs read-only scan

- **Does not wait for `نفّذ`:** reading files; classifying NEW/EXISTING; writing the session map in chat; running `skills/app-security-gate/scripts/scan-secrets.sh` (prints path + kind + line, values redacted).
- **Waits for `نفّذ`:** any file write, secret rotation, git history rewrite, deploy, install/upgrade of libraries, deleting files.

---

## Verification protocol

### Before any operation

1. Actually read this file, and only the skills tied to the current task.
2. Start the reply with: `Read: AGENTS.md + [skill names]` — do not write that line if you did not read.
3. Two lines: what is allowed now, what is forbidden. Stay inside that bound.
4. If the task would violate a rule here, stop and ask.

### During execution

5. Do not say "done" / "fixed" / "it works" without evidence: path + line + code after the edit + command output.
6. Intent is present tense ("I will"). Past tense only after a real mutation.
7. Do not invent command output or measurements. If you did not run it: `not run`.
8. Announce inability immediately. Declared failure is acceptable. Hidden failure is not.
9. Do not fake a fix: silence a warning instead of fixing it, empty `catch`, delete a failing test, mock in place of required logic. Any temporary path must be labeled `temporary`.

### After every operation

10. Verification table:

    | Claim | file:line | How checked | confirmed / unconfirmed |
    |---|---|---|---|

11. Did this reply violate a rule? If yes: which one, and what you did.
12. List every touched file. Anything outside scope is reported and reverted.
13. One manual check for the user.
14. Do not start the next phase. Wait for `نفّذ` or `التالي` / `next`.

### Integrity

Less than full confidence = `unconfirmed` + what is needed. `I don't know` is required. An invented answer is a serious fault.

---

## Work line (run only what applies)

Do not run every stage on every project. In stage 0, name which stages apply.

### 0 — Baseline
File tree, routes, features as they are, entry points (pages, forms, auth, admin, API).
This list is the acceptance reference. Name ambiguity before starting.

### 1 — Guidance
Inspect `AGENTS.md` / skills / config. Conflicts, duplication, gaps, stale instructions.
Propose update / merge / delete / create. Do not change guidance before approval.

### 2 — Critical security
Exposed secrets, sessions, authz, IDOR, injection, XSS, CSRF, server-side checks, uploads, rate limit, redirect/SSRF, amounts and signatures from the server not the client.
Do not assume a control exists. Read the path line by line.

### 3 — Hardening config
Headers, tight CORS, errors that do not leak, no debug pages in production, logs without PII, listed dependencies not upgraded without permission.

### 4 — Sensitive surfaces (admin / accounts / money / user data)
Real server guards, not a hidden URL. Role check on every call. No privilege escalation. Shorter sessions. Audit sensitive actions. `noindex` on private pages. Confirm before delete. Admin input is untrusted.

### 5 — Behavior quality
No silent placeholder, no TODO on a production path, loading/error/empty, no double submit, no dead links, RTL/responsive if present, time and money formatted correctly.

### 6 — Performance and access
Images and dimensions, bundle, fonts, primary-path budget. Access: name/role, keyboard, contrast, focus.

### 7 — Public visibility (if public pages exist)
Unique metadata, canonical, correct indexing, content in initial HTML not JS-only.
Structured data from the same page facts. Consistent NAP if local.
Anything that needs a domain uses an env var and is listed in `INFRA-TODO.md` if the domain is deferred.

### 8 — GEO (only if asked)
Crawler allowlist only with user approval. `llms.txt` if it fits the product. Direct answer in the first paragraph. Facts in text, not only images. One consistent entity.

### 9 — Infra and deploy
Only after an explicit order. Secrets, README, `.env.example`, main-branch protection, a working branch, SSL/HTTPS, backup, rollback plan.

### 10 — Acceptance
An acceptance scenario that covers the baseline. Compare: no missing feature, no visual change that was not asked for. Residual risk stated plainly.

---

## Bundled skills (if present in the repo)

- `skills/fable` — layered FABLE loader. Do not ingest the whole constitution.
- `skills/app-security-gate` — mandatory before ship and when touching API, admin, data, or secrets.
- Copy the skill into the tool's skills folder. Do not paste its body into this file.

## Git

- Do not work on the main branch directly unless asked.
- If an open PR exists, inspect it first and report conflicts before any edit.

---

**Start at stage 0 only. Write no code before user approval.**
