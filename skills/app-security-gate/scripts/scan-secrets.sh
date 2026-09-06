#!/usr/bin/env bash
# Scan a tree for secret-like patterns. Never prints matched secret values.
# Usage: scan-secrets.sh [root-dir]
set -euo pipefail

ROOT="${1:-.}"
cd "$ROOT"

if command -v rg >/dev/null 2>&1; then
  GREP=(rg -n --no-heading --hidden --glob '!node_modules/**' --glob '!.git/**' --glob '!dist/**' --glob '!.next/**' --glob '!build/**' --glob '!coverage/**' --glob '!*.lock' --glob '!pnpm-lock.yaml' --glob '!package-lock.json')
else
  GREP=(grep -RIn --exclude-dir=node_modules --exclude-dir=.git --exclude-dir=dist --exclude-dir=.next --exclude-dir=build)
fi

# name|regex
PATTERNS=(
  'private-key|BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY'
  'aws-access|AKIA[0-9A-Z]{8,}'
  'stripe-secret|sk_live_[0-9a-zA-Z]+'
  'stripe-test-secret|sk_test_[0-9a-zA-Z]+'
  'github-pat|ghp_[0-9A-Za-z]{20,}'
  'github-finegrained|github_pat_[0-9A-Za-z_]{20,}'
  'openai|sk-[A-Za-z0-9]{20,}'
  'google-api|AIza[0-9A-Za-z_-]{20,}'
  'jwt-like|eyJ[A-Za-z0-9_-]{20,}\.[A-Za-z0-9_-]+\.'
  'supabase-service|service_role'
  'generic-secret|(api[_-]?key|secret[_-]?key|private[_-]?key)\s*[:=]'
  'database-url|postgres(ql)?://[^@/\s]+:[^@/\s]+@'
  'pem-file|\.pem\b'
  'client-public-env|NEXT_PUBLIC_|VITE_|EXPO_PUBLIC_|REACT_APP_'
  'slack-bot|xox[baprs]-'
)

printf 'scan-root\t%s\n' "$(pwd)"
printf 'tool\t%s\n' "${GREP[0]}"
printf 'note\tvalues are redacted; inspect files locally\n"
printf 'kind\tfile\tline\tsnippet\n'

redact() {
  sed -E \
    -e 's/(eyJ[A-Za-z0-9_-]{8})[A-Za-z0-9._-]*/\1***/g' \
    -e 's/(sk_live_|sk_test_|sk-|ghp_|github_pat_|AKIA|AIza|xox[baprs]-)[A-Za-z0-9_-]+/\1***/g' \
    -e 's/(postgres(ql)?):\/\/[^[:space:]"]+/\1:\/\/***/g' \
    -e 's/([:=][[:space:]]*)["'\''][^"'\'']{4,}["'\'']/\1"***"/g'
}

found=0
tmp="$(mktemp)"
envtmp="$(mktemp)"
cleanup() { rm -f "$tmp" "$envtmp"; }
trap cleanup EXIT

for spec in "${PATTERNS[@]}"; do
  kind="${spec%%|*}"
  re="${spec#*|}"
  "${GREP[@]}" -e "$re" . >"$tmp" 2>/dev/null || true
  while IFS= read -r line; do
    [ -z "$line" ] && continue
    file="${line%%:*}"
    rest="${line#*:}"
    lineno="${rest%%:*}"
    snippet="${rest#*:}"
    snippet_redacted="$(printf '%s' "$snippet" | redact | cut -c1-120)"
    printf '%s\t%s\t%s\t%s\n' "$kind" "$file" "$lineno" "$snippet_redacted"
    found=1
  done <"$tmp"
done

find . \( -name '.env' -o -name '.env.*' \) 2>/dev/null | grep -v node_modules | grep -v '/\.git/' | head -n 50 >"$envtmp" || true
while IFS= read -r f; do
  [ -z "$f" ] && continue
  printf 'env-file\t%s\t-\t(present; do not print contents)\n' "$f"
  found=1
done <"$envtmp"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  printf 'git\tHEAD\t-\t%s\n' "$(git rev-parse --short HEAD 2>/dev/null || echo unknown)"
  if git ls-files | grep -qE '(^|/)\.env(\.|$)'; then
    printf 'git-tracked-env\t(tracked env file - High)\t-\tnames only\n'
    found=1
  fi
else
  printf 'git\tabsent\t-\thistory unverified\n'
fi

if [ "$found" -eq 0 ]; then
  printf 'result\tnone\t-\tno pattern hits in scoped tree\n'
fi
exit 0
