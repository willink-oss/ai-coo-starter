# File management rules

## Directory structure

- Department rules live in each `departments/*/DEPARTMENT.md`.
- Dated files use a `YYYY-MM-DD` prefix (e.g. `2026-04-05-daily-report.md`).
- Meeting/standup notes: `assets/meeting-notes/YYYY-MM-DD_weekly-standup.md` (same-day revisions get `-v2`, `-v3` as **new files** — never overwrite the canonical record).

## Freshness & consistency

- **Don't put volatile values in always-loaded docs.** Versions, dates, counts, sprint state don't belong in `CLAUDE.md` / `DEPARTMENT.md` — put them in the latest standup and reference it. Keeps the resident context stable and cache-friendly.
- **State-bearing docs carry a "last updated" date at the top.** A stale date is a signal to re-verify before trusting the content.
- If you change `CLAUDE.md` or a top-level standard, check the others for consistency in the same change.

## Keep `CLAUDE.md` small

- Under ~200 lines. Detail goes to `.claude/rules/` and `standards/`. Consider enforcing with a pre-commit hook.

## Knowledge

- Accumulate durable learnings under `assets/knowledge/` with an index. Append as you go; archive per quarter.
- Before adding a knowledge entry, check for an existing similar one — update it rather than duplicating.
