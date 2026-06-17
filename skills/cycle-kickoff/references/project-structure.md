# Structure of a multi-session project — what each thing is for

**Version:** 1.1.0
**Created:** 2026-06-09 20:22 CEST
**Last updated:** 2026-06-10
**Source:** extracted from the live `northstar-os` (a structure proven in practice) + lessons F1-F6 (BidSentinel, in `LESSONS_CANON.md`).
**What for:** so that `/kickoff` sets up a project following a proven pattern, and a new project is aware of what each element is for (instead of guessing).

---

## Source-of-truth hierarchy (who wins a conflict)

This is the most important rule — when two documents say different things, the higher one wins:

```
1. CLAUDE.md      — how we BUILD (actors, process, rules). Wins over everything.
   AGENTS.md      — how the system RUNS in production (optional, when the project has a runtime).
2. PROJECT_CONFIG.md — parameters, paths, sprint live state (SSOT of numbers).
3. docs/adr/      — accepted decisions ("what and why we decided").
4. docs/specs/    — specifications, standards ("how it should work").
5. docs/runbooks/ — execution ("how to carry it out step by step").
6. code + tests   — after implementation starts.
```

The AI's global memory **is not** a source of truth for the project — it holds only pointers to files in the repo.

**The state documents (HANDOFF/ROADMAP/CONFIG) stand alongside this hierarchy** — they describe "where we are",
not "what is true about the architecture". When they contradict one another, that is **drift to report** (done by
`/start`), not a conflict to silently resolve. The ad hoc arbiter, before the drift is fixed:
**HANDOFF** settles "the next atomic move", **ROADMAP** settles the order of stages and the Position,
**CONFIG** settles the hard live-state numbers (branch, status, risks).

---

## State documents (living — updated every session)

| File | What for | Who updates | Rule |
|---|---|---|---|
| **`docs/HANDOFF.md`** | snapshot "where we are + next move". Thin — does NOT duplicate the numbers from CONFIG. | `/handoff`, `/close` | the only source of "the next atomic move" |
| **`docs/ROADMAP.md`** | sequence + two-level progress: project stages (level 1) and steps of the current stage (level 2, with statuses and verification) + the `Position` line (stage X/N · step Y/M). SSOT of order and position. | `/roadmap`, `/handoff` (step status flip), `/close` | change statuses freely; do not delete/rewrite step content without an explicit decision — a deleted step disappears silently. Links to CONFIG, does not copy numbers |
| **`PROJECT_CONFIG.md`** | parameters + `§Current Sprint` (hard numbers: branch, commits, status, risks). | `/close`, `/handoff` | the only source of live state (`CURRENT_SPRINT`) |
| **`docs/LESSONS_CANON.md`** | the project's lessons canon (F=foundational, W=executional). | `/lesson` | every lesson: Rule + Why + Operational test |

---

## Decision and knowledge documents (grow as the project goes)

| Directory | What for | Format |
|---|---|---|
| **`docs/adr/`** | Architecture Decision Records — 1 file = 1 binding decision. | `ADR-NNN-<topic>.md` |
| **`docs/specs/`** | specifications, sprint plans, registers, standards. | `YYYY-MM-DD-<topic>-{design,plan}.md` |
| **`docs/runbooks/`** | step-by-step procedures (installation, smoke tests). | `YYYY-MM-DD-<topic>.md` |
| **`docs/reports/`** | sprint closeouts — audit trail of closures. | `YYYY-MM-DD-<topic>-closeout.md` |
| **`docs/reviews/`** | cross-AI review results (GPT/Gemini/Codex). | per round |
| **`docs/backlog/`** | follow-ups deliberately deferred. | per topic |
| **`docs/vision/`** | "why, ultimately" — the product vision (optional). | per document |

---

## Working directories

| Directory | What for |
|---|---|
| **`skills/`** | project skills (the `/start`, `/close`… commands). Source in the repo (git trail), global installation to `~/.claude/skills/`. |
| **`runtime/audit/`** | cross-AI bundles (ZIP per round) + synthesis traces. |
| **`src/`, `tests/`, `migrations/`** | code, tests, DB migrations (when the project has code). |
| **`legacy_reference/`** | historical files — reference ONLY, NOT a source of execution. |

---

## Lessons F1-F6 (foundation — what to watch out for, from BidSentinel)

These lessons are in every project's `LESSONS_CANON.md` — a distillate of mistakes that cost time:

- **F1 Buy-before-build** — check whether an off-the-shelf solution exists before you build.
- **F2 Brief before the module** — WHAT + WHY + STOP for approval, before the code.
- **F3 Foundation first** — build from the foundation; measure the variable that really decides.
- **F4 Facts, not assumptions** — verify in the code/data, not from memory; separate facts|assumptions|risks|recommendations.
- **F5 Enterprise patterns** — take proven named patterns, do not invent new ones.
- **F6 Anti-overengineering** — do not build heavy components prematurely; slots for the future, not implementation.

---

## Minimal vs full project (profiles)

Not every project needs everything. `/kickoff` proposes a profile:

- **lite** — `README + PROJECT_CONFIG + docs/{HANDOFF,ROADMAP,LESSONS_CANON}`. Small project/PoC.
- **standard** — lite + `CLAUDE.md + docs/{adr,specs,runbooks,reports} + skills/`. A typical project with process.
- **regulated** — standard + `_ai_ops/ (audit trail) + runtime/audit/ + AGENTS.md`. A project with autonomy/production/audit requirements.

The remaining directories are created lazily — when actually needed (F6).
