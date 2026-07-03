# Approval levels

The boundary between "the AI does it alone" and "ask the human first."

**Decide by reversibility × exposure × money/legal — not by "how important or scary it feels."**
"Technically heavy" is not the criterion. "Can it be undone, and how far does it reach?" is.

---

## Decision procedure (evaluate top-down)

### Step 1 — Always Level 3 (needs prior human approval, regardless of the axes)

1. **Money** (spending above a threshold you set) / **legal** (contracts, pricing, publishing legally-binding docs).
2. **Self-lockout** — anything that breaks or changes the AI's / CI's / automation's *own* ability to run or recover: IAM self-permission changes, secret/token rotation or revocation, **stopping monitoring/detection**, production runtime env, DNS / custom domains. Never "recover using the thing you just broke."
3. **Production-data destruction** — destructive DML/DDL, reset, or pause on customer / shared / production-connected stores. (Reads and additive migrations are excluded.)
4. **Business direction / new public launch / brand / roadmap changes / support & refund policy.**

### Step 2 — Matrix (for everything not caught by Step 1)

|  | Reversible (verify by live measurement) | Irreversible |
|---|---|---|
| **Internal only** | **Level 1** (do now) | **Level 2** (report after) |
| **External reach** (customers / legal-name / public broadcast / public push) | **Level 2** | **Level 3** |

- **External broadcast is irreversible at the moment it reaches someone** — a sent email, a public post, a public release: "it was seen" can't be undone, even if a delete button exists → Level 3. **But an idempotent re-apply of identical content** (a re-deploy, a re-sync) produces no new external change, so treat it as reversible.

### Step 3 — Cross-cutting meta-rules

1. **Prove reversibility by live measurement (no self-report).** Claims like "already replaced / duplicate / already merged / drift-only" don't drop something to L1 unless backed by a measurement taken in the same action (check the API, the deploy, the diff). No measurement → bump it up a level.
2. **Guardrail ⊇ policy.** Fail-closed hooks are a *floor*, not a ceiling. If a guardrail blocks a policy-L1 action, that's an escalation to the human — **don't loosen the guardrail to get around it** (loosening a guardrail is itself L3).
3. **Automation is approved once, at its terminal exposure.** A loop/routine whose single step is L1 but whose *output* reaches external broadcast needs L3 at adoption + a pre-broadcast gate (a human check or an enforced quality gate). If output stays internal (queue/draft), it may run autonomously at L1.
4. **"Can't decide → L3" is only for a missing axis, not an escape hatch.** If both axes (reversibility, exposure) are determinable, L3 is not allowed. Only when one axis can't be determined do you go L3 — and you name the axis you couldn't determine.

---

## When in doubt

1. "Important/heavy/scary" is **not** the criterion — run the procedure above.
2. **When you can't determine reversibility, measure it live** before deciding.
3. **Money / legal / self-lockout / production-data / external broadcast → Level 3.** No exceptions.
4. **Reversible × internal × non-money/non-legal → Level 1.** Do it, report if useful.

---

*This is a generic version of the approval model. Tune the money threshold, the
"production" definition, and any always-L3 categories to your business, and record
material changes as an ADR (`docs/adr/`).*
