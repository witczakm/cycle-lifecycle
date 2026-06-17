---
name: cycle-start
description: Enter a session of a multi-session project — load state from the documents and report "where we are + next move". Use at the start of EVERY project session, when the user types "/start", "let's start the session", "where are we in the project", "what was last in the project", "let's get back to the project", or returns to work after a break. Also run it before you begin any work on a multi-session project, even without being asked. Do NOT use when "start" refers to launching a program, server, container, or script (npm start, docker start, cargo run) or to writing code — that is technical work, not entering a project session.
---
<!-- cycle-lifecycle v2.3.0 -->

# /start — enter a session

## Goal

Start the session from facts, not from memory. You load the project state from the documents and tell the user in a single paragraph: where we are, what was recently closed, and what the next move is. This is read-only. Why: working without loading state leads to decisions based on stale memory, and the documents sometimes drift from reality.

## Steps

0. **Check whether this is a cycle-lifecycle project.** If the project directory has NO PROJECT_CONFIG.md and no docs/HANDOFF.md, it is not a project run with this system. Say so plainly and propose /kickoff (adopt mode). Do not invent state and do not look for files outside the directory.

1. **Load the documents in this order** (one at a time, as needed — not all at once):
   - PROJECT_CONFIG.md — the Current Sprint section (live state: branch, status, risks).
   - docs/HANDOFF.md — the "Snapshot" section (where we are + next move).
   - docs/ROADMAP.md — Position (stage X/N · step Y/M) + the breakdown of the current stage.
   - docs/LESSONS_CANON.md — what not to repeat.

2. **Do a light drift-check** (by reading files, not git):
   - Does the HANDOFF/ROADMAP header (Version + Last updated) match the latest changelog entry? A mismatch = drift.
   - Is CURRENT_SPRINT/CURRENT_MILESTONE in PROJECT_CONFIG consistent with HANDOFF and the Position in ROADMAP?
   - Does the Position line match the step statuses in the breakdown?
   - Pending global lessons: scan docs/LESSONS_CANON.md for [CANDIDATE GLOBAL]. If any exist, surface them with a ready-to-run global-save command for your environment (Claude Code or Codex).
   - If something doesn't line up, say so plainly. A false "all good" is worse than an honest "these documents don't match".

3. **Report** (concise, max one page):
   - Position: Stage X/N "name" · step Y/M "name".
   - Where we are (1 sentence).
   - What was recently closed.
   - Next move = ONE step + why (don't plan several steps at once).
   - Detected drift / pending global candidates + a proposed fix.

## Rules

- Work from facts. Missing information = [NO INFORMATION], do not guess.
- Write nothing. Fix drift via /snapshot or /close.
- Do not run git.

## Related

- /snapshot — save state after a decision mid-session.
- /close — wrap up the session at the end.
- /roadmap — show the position and the sequence of work.
