# Routines policy

Rules for any scheduled / automated job the AI COO runs (a cron trigger, a CI
workflow, a scheduled agent). The point: automation multiplies both good and bad,
so it runs inside an explicit boundary.

## Autonomy tiers

- **L1 — report only.** The job produces a report / log; a human acts on it.
- **L2 — human-gated action.** The job proposes; a human approves before it takes effect (a checkbox, a PR merge).
- **L3 — bounded autonomy.** The job acts on its own within a denylist (e.g. auto-merges doc-only PRs).

**New routines start at L1.** Promote to L2 only after it's been stable (low false-positive
rate) for a while. Promote to L3 only if it has: a verification step, the shared denylist
applied, and an explicit stop condition.

## Shared denylist (every routine)

- Never read or emit secrets / credential values.
- Changes to code, CI, or the agent's own config/hooks are **not** done autonomously — they
  follow the code-review approval path (PR + human merge).
- Don't auto-merge a dependency's first major version bump (supply-chain caution).
- No force-push, no history rewrite.
- **No unattended publishing / releasing / tagging to public surfaces** — external broadcast
  is a human-in-the-loop step (see `standards/approval-levels.md`, meta-rule 3).

## Stop conditions (first-class)

- Every routine has an attempt cap (e.g. retry the same fix at most 3× → then stop and
  escalate to the action list).
- Every routine has a "nothing changed → do nothing" path. **No empty commits / empty PRs.**
- A cheap triage check runs first; the expensive action path runs only when there's real work.

## Doc-only vs. code/config routines

- **Doc-only** (writes only to `departments/` / `assets/` docs, never code/CI/config): may use
  PR + auto-merge, or direct commit if your policy allows.
- **Code / config / CI**: PR only, human merge required.

## Observability

- Track each routine's false-positive rate and consecutive failures. A routine that cries wolf
  is worse than no routine — retire or fix it.
- Keep a registry of what's running, its schedule, its tier, and its output location.

*This is a generic policy. Add your registry of actual jobs below, or in a `registry.md`.*
