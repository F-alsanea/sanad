# Seven gates — attack expansion

Read this file when running `app-security-gate`. Do not print secret values. Path + kind + line only.

Gate verdicts: `PASS` | `FAIL` | `UNVERIFIED`.
Do not say the app is secure unless all seven are `PASS` with evidence.

Running `scripts/scan-secrets.sh` is read-only. It does not require `نفّذ`.
Rotation, history rewrite, deletes, and any file write require `نفّذ`.

## Evidence bar (FABLE §9.4)

A `where: { userId }` line in source is not enough for G4 or G6 `PASS`.

- **FAIL:** missing control, or a control that can be skipped (hidden URL, client filter, body-supplied owner).
- **UNVERIFIED (maximum from reading code):** the deny path is visible at `file:line` but was not exercised.
- **PASS:** deny path exercised — command output, failing request without a session, or a test that sends another user's id and is rejected. Quote the output. If you did not run it, write `not run` and keep the gate `UNVERIFIED`.

"Mental test" below is how to design the check. It is not a substitute for running it.

## G1 — Hide API keys

**Pass:** no secret in client bundles, committed files, images, or logs. Client may hold only keys designed to be public.

**Fail examples**
- `sk-`, `sk_live_`, `AKIA`, `ghp_`, `xoxb-`, Stripe/OpenAI/GitHub tokens in source
- Secret assigned in a `"use client"` file or anything bundled to the browser
- Key in a screenshot, README example, or CI log

**Look**
- `.env*` committed, `NEXT_PUBLIC_*` that is not public-by-design
- `wrangler.jsonc` / Docker `ENV KEY=value` / workflow YAML
- `scan-secrets.sh` on the tree, then git history for the same patterns

## G2 — Secrets out of Git

**Pass:** working tree clean **and** history checked (or explicitly `UNVERIFIED` with reason).

**Fail examples**
- Secret removed in HEAD but still in an old commit
- Declaring `.gitignore` without inspecting `git log -p` / `git rev-list`

**Rule**
- A leaked secret is burned. Ask for rotation. Do not rewrite history unless the owner names the remote and says `نفّذ`.

## G3 — Public database key only

**Pass:** the only DB credential on a client is a designed-public key (e.g. Supabase `anon`) with RLS in force. Privileged URLs stay on the server from env.

**Fail examples**
- `service_role` or `DATABASE_URL` in any client file or `NEXT_PUBLIC_*`
- Prisma/Drizzle imported from a client component
- Firebase Admin SDK in the app binary

**Design the check:** if the attacker extracts every string from the bundle, can they write every row?

## G4 — Row-level security (or equivalent isolation)

**Pass:** every table (or collection) with per-user or per-tenant rows has enforced isolation. Owner is taken from the session, not from the body. Deny path exercised (see Evidence bar).

**Fail examples**
- `USING (true)` / `allow read, write: if true` on a sensitive table
- RLS enabled with no policy (default deny is fail-closed only if the app still functions; document it)
- Filter only in the UI or only in a client query

**Design the check:** user changes `id` in the request. They must not see or write another row. Reading `where: { userId: session.user.id }` alone → `UNVERIFIED`, not `PASS`.

**Non-Supabase:** Prisma with one privileged `DATABASE_URL` and no Postgres policies = app-layer authz only. Mark G4 `FAIL` or `UNVERIFIED` unless equivalent isolation is proven in every query **and** the deny path was exercised. Do not call it RLS.

## G5 — Encrypt sensitive data

**Pass:** passwords are a slow hash (not reversible). Third-party tokens and high-risk PII are encrypted at rest with a key that is not in the repo. HTTPS alone is not at-rest encryption.

**Fail examples**
- Plaintext passwords or JWT secrets in the database committed as fixtures
- Lead phones / national IDs stored raw with no stated at-rest story
- Encryption key checked into Git

## G6 — Server-side authentication

**Pass:** identity, role, and row ownership are decided on the server before read or write. Missing session = deny. Deny path exercised (see Evidence bar).

**Fail examples**
- Admin route protected only by hiding `/admin`
- Middleware cookie check without a server re-check (`requireAdmin` or equivalent)
- Role accepted from a client field
- Client-only `localStorage` "logged in"

**Design the check:** call the write action with no cookie. It must fail closed. Locating `requireAdmin` at `file:line` without running a request → `UNVERIFIED`, not `PASS`.

## G7 — Secure logs

**Pass:** logs and error pages contain no access token, password, raw body with PII, or `Authorization` header.

**Fail examples**
- `console.log(req.body)` on login or checkout
- Prisma query logs in production that print connection strings
- Audit `before`/`after` blobs that dump full lead rows to a world-readable sink

## After the seven

Short pass only, unless the task is a full review: injection, XSS, CSRF, uploads, SSRF, unsigned webhooks, login/OTP rate limit, `CORS *` + credentials, production headers.

Stack-specific search paths: `references/stack-adapters.md`.
Report shape: `assets/report-template.md`.
