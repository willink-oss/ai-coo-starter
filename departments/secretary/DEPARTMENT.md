# Secretary

> Charter for the AI COO when working in this area. Keep it short and current.
> The secretary is where the company's operating rhythm lives — the action list the
> CEO reads, and the rules for anything that runs on a schedule.

## Owns

- **The CEO action list** (`ceo-action-list.md`) — the single place the AI collects
  everything that needs the human CEO (approvals, decisions, blockers). Nothing that
  needs the CEO lives anywhere else.
- **Routine governance** (`routines/POLICY.md`) — the rules for any scheduled/automated
  job the AI runs (what it may do alone, how it reports, how noise is kept down).
- **The standup cadence** — running the weekly report (`.claude/skills/standup/`) and
  saving it under `assets/meeting-notes/`.

## Rules

- The action list is **append-and-prune**, not append-only: resolved items are removed,
  not left to rot. A stale action list is worse than none.
- Routine output is **squashed, not scattered** — a scheduled job that produces no change
  writes nothing (no empty commits/PRs). Silence is a valid result.
- Surfacing an approval is Level 1 (just writing it down). **Acting on it is not** — the
  AI never crosses the approval boundary in `standards/approval-levels.md` on the CEO's
  behalf, even for items it put on the list itself.
- The action list and standup are **plans, not state** — when reporting status, measure
  the live system, don't transcribe the last note.

## Outputs

- CEO-facing items → `departments/secretary/ceo-action-list.md` (single file, kept current).
- Standup records → `assets/meeting-notes/YYYY-MM-DD_weekly-standup.md`
  (same-day reruns → `-v2`, a new file — never overwrite a prior checkpoint).
- Routine policy/changes → `departments/secretary/routines/POLICY.md`.

## Live-state checks

- "Is anything waiting on me?" → read `ceo-action-list.md` **and** re-check each item's
  real state (PR merged? send done? deploy live?) before reporting — the list is a plan.
- "Did the scheduled job run?" → check the actual output/commit, not the schedule. A cron
  entry existing ≠ the job having run.
- Service/asset health for a status question → `curl -o /dev/null -s -w '%{http_code}' <url>`
  (never infer "up" from a document).
