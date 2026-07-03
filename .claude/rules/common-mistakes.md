# Common mistakes → active rules

> Behaviors an AI COO tends to converge on that hurt a small company. Read before working.
> When a new mistake happens, add a one-line rule here (keep the detail in a knowledge archive,
> not in this always-loaded file).

## Counter-convergence (patterns to actively resist)

- **No unrequested features / over-engineering** — do the thing that was asked, not the thing you imagine around it.
- **Don't over-spawn subagents** — a single read or one or two searches don't need a subagent.
- **No empty commit messages** — a correct prefix isn't enough; write the *why*, not "update X."
- **Don't repeat unchanged items** in standups — if nothing changed, say "no change" in one line.
- **Don't infer state from documents (most important).** Documents are *plans*; live systems are *state*. Before any status report (remaining work, PR state, uptime, progress), take at least one live measurement (API call, HTTP check, deploy status). The CEO phrasing something as present-tense doesn't make a stale asset live — verify.
- **Re-measure when re-packaging a measurement.** "I measured this once" ≠ "I measured it." Before turning a PR number or URL into a list, re-run the check.
- **Empty output ≠ zero.** A blank result from a script/CLI isn't "0 found" — check the exit code and stderr; a failed fetch is "unknown," not "none."
- **A subagent's critical claim is re-verified before you act on it** — "already committed" / "not implemented" style assertions get checked against live state first.

## Git

- **No direct pushes of code changes to the main branch** — feature branch + PR. (Doc-only routine commits may be an explicit exception if your policy allows.)
- **No `git reset --hard`** — use `git stash` / `git revert`.
- **No force push** without explicit human approval.
- **Commit with path scoping** — `git commit -m ... -- <paths>` so a concurrent session's staged files don't ride along.

## Files & secrets

- **Never commit `.env` or secrets** — manage `.env.example` only; keep real values in env vars / a secret manager.
- **No credentials in code.**

## Hooks & guardrails

- **New fail-closed hooks need a self-test** (a blocked case and a passing case) before adoption.
- **Security (`Pre*`) hooks fail closed; notification hooks fail open.**
- **Don't depend a fail-closed hook on a single CLI** (e.g. `jq`) — its absence would halt everything; provide a fallback.
