#!/usr/bin/env bash
# Example PreToolUse hook — SECURITY guard, FAIL-CLOSED.
#
# A guardrail is a rule the machine enforces, not one you hope the agent remembers.
# This one blocks a few obviously-dangerous Bash commands before they run. It is a
# TEACHING EXAMPLE — extend the denylist for your own company, or adopt the fuller
# library in willink-claude-kit (https://github.com/willink-oss/willink-claude-kit).
#
# Wire it up in .claude/settings.json:
#   {
#     "hooks": {
#       "PreToolUse": [
#         { "matcher": "Bash",
#           "hooks": [{ "type": "command", "command": ".claude/hooks/pre-bash-guard.sh" }] }
#       ]
#     }
#   }
#
# Contract:
#   - Input arrives as JSON on STDIN (not env vars); parse with jq.
#   - exit 0 → allow the tool call.  exit 2 → BLOCK it and show stderr to the agent.
#   - Security (Pre*) hooks FAIL-CLOSED: on any internal error (missing jq, unparseable
#     input) we BLOCK rather than silently allow.
#   - Portability: POSIX ERE via `grep -E` only — no `grep -P` and no \s/\d/\w escapes,
#     which BSD grep (macOS) does not support.
set -uo pipefail

fail_closed() {
  printf 'pre-bash-guard error: %s — blocking (fail-closed)\n' "$1" >&2
  exit 2
}

command -v jq >/dev/null 2>&1 || fail_closed "jq not found"

input="$(cat)" || fail_closed "could not read hook input"
[ -n "$input" ] || fail_closed "empty hook input"
tool="$(printf '%s' "$input" | jq -r '.tool_name // empty')" || fail_closed "unparseable hook input"
cmd="$(printf '%s' "$input" | jq -r '.tool_input.command // empty')" || fail_closed "unparseable tool_input"

# Only gate Bash; anything else passes through.
[ "$tool" = "Bash" ] || exit 0

# Illustrative denylist — EXTEND for real use. POSIX ERE only. Catches:
#   1. rm -rf of / ~ $HOME or a top-level system dir
#   2. curl/wget … | sh   (piping remote content into a shell)
#   3. git push --force / git reset --hard / git commit --no-verify
deny='(^|[[:space:]])rm[[:space:]]+-[[:alpha:]]*f[[:alpha:]]*[[:space:]]+(/|~|\$HOME)([[:space:]]|$)'
deny="$deny"'|(^|[[:space:]])rm[[:space:]]+-[[:alpha:]]*f[[:alpha:]]*[[:space:]]+/(etc|usr|var|bin|lib|boot|sys|dev|opt|root|sbin)([[:space:]/]|$)'
deny="$deny"'|(curl|wget)[[:space:]].*\|[[:space:]]*(ba|z)?sh([[:space:]]|$)'
deny="$deny"'|git[[:space:]]+push[[:space:]].*--force'
deny="$deny"'|git[[:space:]]+reset[[:space:]].*--hard'
deny="$deny"'|git[[:space:]]+commit[[:space:]].*--no-verify'

if printf '%s' "$cmd" | grep -qE -- "$deny"; then
  printf 'blocked dangerous command: %s\n' "$cmd" >&2
  exit 2
fi

exit 0
