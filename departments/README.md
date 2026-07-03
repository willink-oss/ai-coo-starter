# departments/

The company, as folders. Each department is a directory with a `DEPARTMENT.md`
charter that tells the AI COO how to operate in that area.

You don't need many. Start with what you actually do. A one-person company might
have just `secretary/` (ops, action list, routines) and one or two more
(`engineering/`, `marketing/`) — add a department only when a real, recurring
area of work needs its own rules.

## How to add one

1. Copy `_TEMPLATE/` to `departments/<name>/`.
2. Fill in `DEPARTMENT.md`: what this area owns, its rules, where its outputs go.
3. Reference it from `CLAUDE.md` if it's central.

## The secretary department

`secretary/` is special — it holds the two files you touch most:

- `ceo-action-list.md` — the single place the AI collects things that need **you**.
- `routines/POLICY.md` — the rules for any scheduled/automated jobs the AI runs.
