# Contributing to ai-coo-starter

Thanks for wanting to improve this. `ai-coo-starter` is a **template** — a structure other
people copy to run their own one-person company on an AI COO. That shapes what good
contributions look like: keep it general, keep it honest, keep it small.

## What fits here

- **Better templates and examples** — a clearer `DEPARTMENT.md`, a more useful sample
  standup, an additional skill worth starting from.
- **Sharper rules** — an anti-pattern in `.claude/rules/common-mistakes.md` that generalizes
  beyond one company.
- **Docs** — anything that makes the zero-to-first-standup path smoother.
- **Guardrail examples** — additional `.claude/hooks/` examples (fail-closed, portable).

## What does *not* fit

- **Company-specific content.** No real API keys, tokens, internal URLs, client names, or
  private business data — this repo is the sanitized structure, not a company's data. PRs
  that add anything company-specific will be asked to genericize it.
- **Heavy dependencies.** The template stays copy-and-run: Markdown + small POSIX shell.
  Enforcement tooling lives in its pair, [willink-claude-kit](https://github.com/willink-oss/willink-claude-kit).
- **Over-claiming.** Keep the README honest about what the template does and doesn't do.

## How to contribute

1. Fork and branch (`improve/<short-name>` or `fix/<short-name>`).
2. Make the change. If you touch a shell hook, keep it fail-closed-where-it-blocks and BSD-grep
   portable (see `.claude/hooks/README.md`).
3. Update [`CHANGELOG.md`](CHANGELOG.md) under `## [Unreleased]`.
4. Open a PR describing **what** changed and **why** it generalizes.

## Conventions

- **Commit messages**: `type: what changed and why` (e.g. `docs: add sample standup output`).
- **Versioning**: [SemVer](https://semver.org/). Template/structure changes are usually minor;
  a breaking change to the expected layout is major. Releases are tagged `vMAJOR.MINOR.PATCH`.
- **Decisions** worth remembering go in `docs/adr/` (see the template there).

## Conduct

Be decent. Assume good faith, critique the work not the person. Harassment isn't welcome.

## License

By contributing you agree your contribution is licensed under the repo's [MIT License](LICENSE).
