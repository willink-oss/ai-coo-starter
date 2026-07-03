# ADR-0001: Approval by reversibility × exposure — <date>

## Status

Accepted (example ADR — shipped with the template to show the format).

## Context

A one-person company with an AI COO needs the AI to act autonomously to be useful, but the
human's time and judgment are the scarce resource. A naive rule — "when in doubt, ask" —
sounds safe but quietly clogs the human with reversible, internal, harmless approvals. The
more you automate, the more homework the human accumulates ("negative automation").

"Important / technically heavy / scary" turns out to be the *wrong* axis for deciding what
needs approval.

## Decision

Decide the approval level by **reversibility × exposure × money/legal**, using the procedure
in [`standards/approval-levels.md`](../../standards/approval-levels.md):

- Always ask first for: money, legal, self-lockout, production-data destruction, external
  broadcast, new public launches, brand.
- For everything else, a 2×2 of reversible/irreversible × internal/external decides L1/L2/L3.
- Reversibility must be **proven by live measurement**, not self-reported.
- Guardrails are a floor, not a ceiling; automation is approved once at its terminal exposure;
  "can't decide" is only valid when an axis is genuinely undeterminable.

## Rationale

This concentrates the human's scarce attention on the decisions that are actually
irreversible, outward-facing, or binding — and lets the AI move on everything that is
reversible and internal. It also closes the AI's self-loosening path (guardrail ⊇ policy).

## Consequences & reversibility

- Reversible: the policy is versioned; revert if it misfires.
- Safety: money / legal / self-lockout / production-data / external broadcast get *stricter*,
  not looser — only the reversible-and-internal quadrant gets faster.

## Related

- `standards/approval-levels.md` — the operative procedure.
- `.claude/rules/common-mistakes.md` — "documents are plans; live systems are state" (the
  measurement discipline this decision depends on).
