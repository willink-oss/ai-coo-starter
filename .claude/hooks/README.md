# .claude/hooks/

Guardrails that run **automatically**, so a safety rule doesn't depend on the agent
choosing to remember it. Claude Code runs these shell commands at lifecycle events
(before a tool call, after a file write, etc.) and their exit code decides what happens.

## What's here

- [`pre-bash-guard.sh`](pre-bash-guard.sh) — a **fail-closed** `PreToolUse` example that
  blocks a few obviously-dangerous Bash commands (`rm -rf /`, piping the web into a shell,
  `git push --force`, …). It's a teaching example — extend the denylist for your company.

Wire it up in `.claude/settings.json` (see the header of the script for the exact snippet).

## The two rules that matter

1. **Fail-closed vs fail-open — pick by the hook's job.**
   - A **security gate** (`PreToolUse`) that can *block* must **fail-closed**: on any
     internal error (missing `jq`, unparseable input) it denies (`exit 2`). A gate that
     silently allows on error is worse than no gate.
   - An **advisory/notify** hook (`PostToolUse`, `Notification`, `Stop`, `SessionEnd`, …)
     must **fail-open** (`exit 0`) so a missing tool never breaks your session.

2. **`grep` portability.** CI and Linux ship GNU grep; macOS ships **BSD grep**. Use POSIX
   ERE (`grep -E`) and POSIX classes (`[[:space:]]`, `[[:digit:]]`) — **not** `grep -P` or
   `\s`/`\d`/`\w`, which BSD grep rejects.

## Want more than an example?

This directory is intentionally minimal — one hook to show the shape. For a maintained
library of guardrails (secret-scanning, file-protection, commit-quality checks) plus a
self-test harness, use **[willink-claude-kit](https://github.com/willink-oss/willink-claude-kit)**,
the technical-guardrails half of the willink-oss pair. `ai-coo-starter` gives you the
*operating structure*; `willink-claude-kit` gives you the *enforcement layer*.
