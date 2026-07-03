# Changelog

All notable changes to this template follow [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and [Semantic Versioning](https://semver.org/).

## [0.2.0] - 2026-07-03

First-run completeness pass — the template now runs end-to-end without the reader having to
invent the missing pieces.

### Added
- **`departments/secretary/DEPARTMENT.md`** — the secretary charter that `getting-started.md`
  referred to as "already here." The example department is now actually complete, not just a
  reference to `_TEMPLATE/`.
- **`assets/meeting-notes/2026-01-06_weekly-standup-SAMPLE.md`** — a sample standup output so
  you can see the shape (live-state stamps + a "Waiting on you" section) before your first run.
- **`.claude/hooks/`** — a fail-closed `pre-bash-guard.sh` example plus a `README.md` explaining
  fail-closed vs fail-open and BSD-grep portability, and pointing to willink-claude-kit for the
  full guardrail library. (`.claude/hooks/` was referenced in the README but was empty.)
- **`CONTRIBUTING.md`** — how to contribute, what fits the template, versioning conventions.
- **`CHANGELOG.md`** — this file.

### Changed
- README status bumped to `v0.2.0`; the "what's in here" table now matches what actually ships.

## [0.1.0] - 2026-07-03

### Added
- Initial public release: operating manual (`CLAUDE.md.template`), approval boundary
  (`standards/approval-levels.md`), agent rules (`.claude/rules/`), weekly standup skill,
  department templates, ADR template + example, and a getting-started walkthrough.
