# Getting started

From an empty template to your first AI-COO standup.

## 0. Prerequisites

- [Claude Code](https://claude.com/claude-code) (or another coding agent that reads a repo).
- A git repo for your company (this template — click **Use this template** on GitHub, or clone).

## 1. Make the operating manual yours

```bash
mv CLAUDE.md.template CLAUDE.md
```

Edit `CLAUDE.md` and fill in every `<...>`:
- who you are and what the AI's role is,
- your current focus (and what you're deliberately *not* doing),
- your goal, with a date.

This file is read at the start of every session — it's what makes the agent act like *your*
COO instead of a generic assistant.

## 2. Set your approval boundary

Open `standards/approval-levels.md`. This is the most important decision you'll make: **what
the AI may do without asking.**

Tune three things to your business:
- the **money threshold** for Level 3,
- what counts as your **"production"** (the data/systems that are dangerous to touch),
- any extra **always-ask** categories specific to you.

The default is deliberately conservative — reversible, internal, non-money things are Level 1;
anything that reaches the outside world or can't be undone climbs toward Level 3.

## 3. Shape the org

You don't need every department. Start with `secretary/` (already here) and add one or two
areas you actually work in:

```bash
cp -r departments/_TEMPLATE departments/engineering   # example
$EDITOR departments/engineering/DEPARTMENT.md
```

## 4. Run your first standup

Open the repo in Claude Code and say:

> Run the weekly standup.

The AI will: pull, **measure live state** (not trust documents), report last period's
outcomes and this period's priorities, and — importantly — **list everything waiting on your
approval** so nothing stalls silently. Its output gets saved under `assets/meeting-notes/`.

## 5. Establish the loop

- The AI works tasks, commits deliverables, and collects anything needing you in
  `departments/secretary/ceo-action-list.md`.
- You check that list in spare moments and approve/decide.
- Weekly, the standup re-baselines from live state.

That's the whole thing: **the AI holds execution; you hold strategy and the approval boundary.**

## Where to go next

- Add scheduled jobs under the rules in `departments/secretary/routines/POLICY.md`.
- Record irreversible-ish decisions as ADRs in `docs/adr/` (see the example there).
- Grow `.claude/rules/` and `.claude/skills/` as you discover how *you* want the AI to work.
