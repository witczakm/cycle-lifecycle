# HANDOFF — transition between threads {PROJECT_NAME}

**Version:** 1.0.0
**Created:** {YYYY-MM-DD HH:MM CEST}
**Last updated:** {YYYY-MM-DD HH:MM CEST}
**Author:** {author}
**Status:** LIVING DOCUMENT — state snapshot between sessions. Every new thread reads this after `PROJECT_CONFIG.md`.

> **What this file is for:** so a new thread can pick up the work without losing context. This is a **thin** snapshot —
> it does NOT duplicate live state from `PROJECT_CONFIG.md` (commits, tests, dates). It adds what the config lacks:
> "why we are here" and "what the next move is".

---

## Start of every new thread — reading order

1. `PROJECT_CONFIG.md` → `Current Sprint` — where exactly we are (live, authoritative).
2. `docs/HANDOFF.md` (this file, "Snapshot" section) — why we are here + the next move.
3. `docs/ROADMAP.md` — the sequence.
4. `docs/LESSONS_CANON.md` — what not to repeat.

---

## State snapshot (update at the end of every longer thread)

**Snapshot date:** {YYYY-MM-DD}

**Where we are (in one sentence):**
{...}

**Recently closed:**
{...}

**Next move + why:**
{...}

---

<!-- INSTRUCTION FOR THE AI MODEL — you can skip this section when reading the file manually -->

## How to update this snapshot (at the end of a thread)

Overwrite the "Snapshot" section with four things: **date** · **where we are** · **recently closed** ·
**next move + why**. Always OVERWRITE (a snapshot = the "now" state), do not append further lines —
the trace of changes stays in the changelog. Do not copy commits/tests here — that is what `PROJECT_CONFIG` does.
In the same move: bump the version + "Last updated" in the header **+ a changelog row** —
the drift check in `/start` compares the header against the changelog, and a bump without a row is a false alarm.

---

## Changelog

| Version | Date | Change |
|---|---|---|
| 1.0.0 | {YYYY-MM-DD} | Initial — handoff template from /kickoff. |
