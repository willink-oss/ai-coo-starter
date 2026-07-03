# ai-coo-starter

**Run a one-person company with an AI COO.** A starter template for using Claude Code (or any coding agent) as your operating partner — not just a code generator, but the entity that runs day-to-day execution, ops, and coordination while you (the human CEO) keep strategy and final approval.

> Built from a real one-person company that runs its execution on an AI COO. This repo is the **sanitized, reusable structure** — the operating manual, not the company's data.
>
> Part of the [willink-oss](https://github.com/willink-oss) family. Pairs with [willink-claude-kit](https://github.com/willink-oss/willink-claude-kit).

---

## The idea

Most "AI for solopreneurs" advice stops at "use AI to write faster." This goes further: **give the AI a role, a rulebook, and an approval boundary**, then let it run the company's execution loop.

- **You (CEO)** — strategy, final approval, the things only a human should decide.
- **AI COO** — implementation, ops, coordination, documentation, monitoring. Reports to you in a fixed format. Never crosses the approval boundary without you.

The value isn't the code the AI writes. It's that a **single person can hold the surface area of a whole company** — because the operating structure (roles, rules, approval levels, routines, standups) is written down and the AI executes against it consistently.

## What's in here

| Path | What it is |
|---|---|
| `CLAUDE.md.template` | The COO's operating manual. Rename to `CLAUDE.md` and fill in your company. The agent reads this first, every session. |
| `standards/approval-levels.md` | The approval boundary. **reversibility × exposure × money/legal** — decides what the AI does alone vs. what needs you. The most important file. |
| `.claude/rules/` | How the AI works: how it reports (PREP), how it manages files, the mistakes it must not repeat. |
| `.claude/skills/standup/` | Weekly standup skill — the AI reports progress + **surfaces everything waiting on your approval** so nothing stalls silently. |
| `.claude/hooks/` | Example guardrails (safety checks that run automatically, not left to the agent's goodwill). |
| `departments/` | The org as folders. Each "department" is a directory with a `DEPARTMENT.md` charter. The secretary department holds your action list + routine governance. |
| `docs/getting-started.md` | Zero-to-running: from empty repo to your first AI-COO standup. |
| `docs/adr/` | Architecture Decision Records — how the company records irreversible-ish decisions. |

## Quickstart

```bash
# 1. Use this template (GitHub: "Use this template") or clone
git clone https://github.com/willink-oss/ai-coo-starter my-company
cd my-company

# 2. Make the operating manual yours
mv CLAUDE.md.template CLAUDE.md
$EDITOR CLAUDE.md   # fill in: company, your role, the AI's role, focus

# 3. Set your approval boundary
$EDITOR standards/approval-levels.md   # what the AI may do alone

# 4. Open in Claude Code and run your first standup
#    "Run the weekly standup" → the AI reports + lists what needs your approval
```

Full walkthrough: [`docs/getting-started.md`](docs/getting-started.md).

## Principles this encodes

1. **The approval boundary is explicit and mechanical** — decided by reversibility × exposure × money/legal, not by "feels important." See `standards/approval-levels.md`.
2. **Documents are plans; live systems are state** — the AI verifies real state (APIs, deploys, DNS) before reporting status. It doesn't trust its own notes.
3. **Nothing waits silently** — the standup always surfaces what's pending your approval. A single un-checked approval shouldn't be able to stall the company.
4. **Write it down once, execute consistently** — roles/rules/routines live in the repo so the AI (and future-you) act the same way every time.
5. **Honesty over polish** — report failures with the evidence. "Done" only when verified.

## Status

`v0.1.0` — foundational structure (operating manual, approval levels, rules, standup, department templates). More modules (routine automation patterns, additional skills, hook library) ship incrementally.

## License

MIT — see [LICENSE](LICENSE). Use it, fork it, run your own company on it.
