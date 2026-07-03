---
name: standup
description: Weekly standup — the AI reports progress from live state and surfaces everything waiting on the CEO's approval. Triggers: standup, weekly report, progress, what's pending.
allowed-tools: Read, Write, Edit, Glob, Grep, Bash
---

# Weekly standup

The AI COO's weekly report. The point is not a pretty summary — it's that
**progress is measured from live state, and nothing that needs the CEO stays hidden.**

## Steps

1. `git pull` to sync.
2. **Measure live state first.** Don't report status from documents. For anything with a
   real system behind it (deploys, services, PRs, DNS), take a live measurement (HTTP
   check, API call, PR state) and treat *that* as the source of truth. If a customization
   script exists (`scripts/live-state-check.sh`), run it and use its output.
3. Summarize last period's outcomes from the latest canonical standup + the action list
   (both are *plans* — verify anything that claims a live state).
4. List this period's priorities (max 5).
5. **Project status table** — one line per project, each stamped with the measurement time.
   Mark anything you couldn't measure as "unknown," never as "0" or "fine."
6. **⏳ Waiting on the CEO (required).** List everything pending the CEO's decision:
   - unapproved items in any approval queue (content, sends, releases),
   - non-routine pull requests awaiting review/merge,
   - decisions/ADRs awaiting adoption.
   Put the **most time-critical approval first** — a single un-checked approval that stalls
   a recurring process (e.g. a scheduled send) is the top item. If nothing is pending, say
   "nothing waiting ✅" explicitly.
7. **Blockers & CEO confirmations** — update `departments/secretary/ceo-action-list.md`.
8. Save to `assets/meeting-notes/YYYY-MM-DD_weekly-standup.md` (same-day reruns → `-v2`, new file).

## Gotchas

- **Documents are plans; live systems are state.** Don't transcribe the action list or an old
  standup as if it were current state.
- **"Measured once" ≠ "measured."** Re-check PRs/services when you re-package a report.
- **Empty output ≠ zero.** Check exit codes; a failed fetch is "unknown."
- **Unchanged items get one line** ("no change") — keep the row for completeness, drop the detail.
