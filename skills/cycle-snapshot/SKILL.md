---
name: cycle-snapshot
description: A light state snapshot mid-session in a multi-session project — overwrite HANDOFF, refresh PROJECT_CONFIG and the step status in the roadmap after a significant decision, without lessons and without a commit. Use when the user types "/snapshot", "/handoff", "save state", "take a snapshot", "lock in this decision", or when a roadmap step closes or an important decision is made during a long session. This is not the end of the session (that's /close) — it's a snapshot in progress. Do NOT use for test snapshots (Jest/Vitest), virtual machines, databases, or containers — this skill is only about the lifecycle project's state documents.
---
<!-- cycle-lifecycle v2.3.0 -->

# /snapshot — a snapshot mid-session

## Goal

Lock in the state right after an important decision or a closed step, instead of waiting until the end of the session. The roadmap should be current DURING the work, not only afterward — /snapshot is the mechanism for ongoing updates between /start and /close.

## Steps

1. **Check the live repo** for the current state of HANDOFF + PROJECT_CONFIG + ROADMAP + the system date.

2. **Update the state:**
   - docs/HANDOFF.md — OVERWRITE the "Snapshot" section (date · where we are · recently closed · next move + why). Always overwrite — a snapshot describes the state "now". The trail of interim decisions stays in the changelog.
   - docs/ROADMAP.md — ONLY if the decision closed a step or changed the current step: flip the status and move the Position. Don't change step content or the sequence of stages — that's done by /roadmap update on an explicit command.
   - PROJECT_CONFIG.md — Current Sprint — if the decision changed the live state (status/branch/next decision).

3. **Sync the header + changelog** — for every edited document that has a changelog (HANDOFF, ROADMAP): bump Version + Last updated and add a changelog row in the same move. CONFIG: bump only the header (Version + date — no changelog).

4. **Show** briefly: what you changed + the new Position (if it moved).

## Rules

- Snapshot only. No lessons, no commit command — those belong to /close.
- Flip a step status only when verification is satisfied (the "Verification" column in ROADMAP). DONE without proof = false progress.
- Do not run git. Commit in bulk at /close.

## Related

- /close — full session wrap-up (snapshot + lessons + commit).
- /start — reads the snapshot on the next entry.
