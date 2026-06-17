# ROADMAP — {PROJECT_NAME} (SSOT for "the sequence" + progress)

**Version:** 1.0.0
**Created:** {YYYY-MM-DD HH:MM CEST}
**Last updated:** {YYYY-MM-DD HH:MM CEST}
**Author:** {author}
**Status:** LIVING DOCUMENT — the **only** source of truth about work order and position in the sequence.

> **What this file is for:** so every session knows two things at once — which **project stage**
> we are on and which **step of that stage**. Without it, multi-session work loses its position.
> **Relation to other sources (links, does not duplicate):** live state (commits/tests/dates) → `PROJECT_CONFIG.md`;
> how we build → `CLAUDE.md`; what not to repeat → `docs/LESSONS_CANON.md`; transition between threads → `docs/HANDOFF.md`.
>
> **Editing rule (important):** change statuses freely (`/handoff`, `/close`, `/roadmap update`),
> but **do NOT delete and do NOT rewrite** the content of stages and steps while changing a status.
> A deleted step is work that disappears silently — no one will notice it is missing. Changing scope
> requires an explicit decision by the user + a reason in the changelog.

---

## 0. In short, in plain terms

{1-2 sentences: what we are building and in what order.}

---

## 1. Position (updated every session — this is what `/start` reads)

**Stage {X}/{N}: {stage name}** · **step {Y}/{M}: {step name}** · step status: {IN_PROGRESS}

---

## 2. Stages (level 1 — the whole project)

Statuses: `TODO` / `IN_PROGRESS` / `DONE` / `BLOCKED`.

| # | Stage | Status | Exit gate (what must be true to consider the stage DONE) |
|---|---|---|---|
| 1 | {stage 1} | IN_PROGRESS | {...} |
| 2 | {stage 2} | TODO | {...} |
| 3 | {stage 3} | TODO | {...} |

---

## 3. Breakdown of the current stage (level 2 — steps)

> ONLY the current stage is broken down (F6 — anti-overengineering). You break down the next stage at
> `/close`, once the current one moves to DONE. The "Verification" column is the condition for flipping to DONE —
> a step without verification met is not done, regardless of impression.

**Stage {X}: {name}**

| # | Step | Status | Verification (how we will check it is done) |
|---|---|---|---|
| {X}.1 | {step} | IN_PROGRESS | {e.g. test passes / file exists and has section Y / smoke test OK} |
| {X}.2 | {step} | TODO | {...} |
| {X}.3 | {step} | TODO | {...} |

---

## 4. Next move (one step at a time)

- **WHAT:** {one step from the table above}
- **WHY:** {...}
- **Gate:** {which decisions/approvals before starting}.

---

## 5. Open strategic decisions (belong to the owner)

| # | Decision | Status |
|---|---|---|
| S1 | {...} | OPEN |

---

## Changelog

| Version | Date | Change |
|---|---|---|
| 1.0.0 | {YYYY-MM-DD} | Initial — stages from the /kickoff interview, stage 1 broken down, Position = 1/{N} · 1/{M}. |
