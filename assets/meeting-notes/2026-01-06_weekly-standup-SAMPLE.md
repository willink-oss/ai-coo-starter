# Weekly standup — 2026-01-06 (Mon)  ·  SAMPLE

> This is a **sample output** so you can see the shape a standup takes. It's a fictional
> one-person SaaS ("Larkspur", a solo indie analytics app) — replace with your own on the
> first real run. The point to notice: every status line is stamped with a live measurement
> time, and the **"Waiting on you"** section puts the thing that stalls the company first.

## Point (bottom line)
Shipped the CSV export feature and fixed the billing webhook. One thing is blocking the
release: the new pricing copy needs your sign-off before it can go public.

## ⏳ Waiting on you (CEO)
1. 🔴 **Approve the new pricing page copy** (5 min · blocks the v1.4 release) — draft in
   `departments/marketing/pricing-copy-v1.4.md`. The release is otherwise done and green;
   this is the only gate.
2. 🟡 **Decide: keep the free tier at 3 projects or drop to 1?** — a Level 3 (pricing) call.
   Notes + tradeoffs in `ceo-action-list.md`.
3. ✅ Nothing else pending.

## Last week's outcomes (verified from live state)
- ✅ CSV export shipped — `GET /api/export` returns 200, sample file valid (measured 2026-01-06 09:12).
- ✅ Billing webhook fixed — Stripe test event delivered + processed (dashboard shows 0 failures, 7d).
- ✅ Docs site rebuilt — https://larkspur.example 200, new "Export" page present.

## This week's priorities (max 5)
1. Ship v1.4 once pricing copy is approved (above).
2. Onboarding email #2 (draft → your review).
3. Investigate slow dashboard query (p95 up ~30% this week — see below).
4. Dependabot: 2 minor bumps to review.

## Project status (measured 2026-01-06 09:12)
| Project | State | Note |
|---|---|---|
| Larkspur app | 🟢 | https://larkspur.example 200 · v1.3.2 live · v1.4 staged, blocked on pricing copy |
| API | 🟡 | Healthy, but dashboard query p95 480ms→620ms this week — investigate |
| Docs | 🟢 | Rebuilt, Export page live |
| Billing | 🟢 | Stripe webhook 0 failures (7d) |
| Marketing site | 🟢 | 200 · pricing page pending copy approval |

## Blockers & notes
- Release v1.4 is one approval away (pricing copy). Everything else is merged and green.
- Dashboard latency regression is not yet root-caused — flagged, not fixed. Not claiming "fine."

## Deletions / housekeeping
- Removed 3 merged feature branches (all PRs confirmed merged).
