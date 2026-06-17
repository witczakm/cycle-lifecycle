---
name: cycle-roadmap
description: Show the position and sequence of work from the project ROADMAP — which stage of the project we're in and which step of that stage — and optionally update it on an explicit command. Use when the user types "/roadmap", "what comes next in the project", "show the project plan", "show progress", "which stage are we in", "what's the order of work". By default it only shows (read-only). Do NOT use when the topic is a client's or external company's product roadmap or general business strategy — this skill reads only docs/ROADMAP.md of the current lifecycle project. Do NOT use when the question is about the order of steps within a specific current task — this skill reads docs/ROADMAP.md of the lifecycle project, it does not answer general "what to do next" questions.
---
<!-- cycle-lifecycle v2.3.0 -->

# /roadmap — position and sequence of work

## Goal

Show two things at once: where we are in the whole project (stage X of N) and where we are in the current stage (step Y of M). ROADMAP is the single source of truth about order and progress. Read-only by default — an accidental change to the roadmap is drift.

## Steps

1. **If this is the start of the session** (there was no /start in this conversation) — propose /start first: the roadmap alone, without HANDOFF and CONFIG, gives an incomplete picture.

2. **Show** concisely:
   - The Position line: Stage X/N "name" · step Y/M "name".
   - Statuses of the current stage's steps — what's DONE, IN_PROGRESS, TODO.
   - The sequence of the remaining stages (level 1) — one line per stage.

3. **Update ONLY on an explicit command** ("/roadmap update <reason>" or "update the roadmap"):
   - Change statuses / Position / stage breakdown — per the command.
   - Don't delete or rewrite the content of stages and steps when changing a status. A deleted step disappears silently — no one notices it's missing. A scope change requires a reason from the user + a changelog entry.
   - Break the next stage into steps only when the current one is closing (F6). Breaking it down ahead of time will go stale before you get to it.
   - Sync the header (Version + Last updated) + a changelog row in the same move.
   - Don't copy live state here (commits/tests/dates) — that lives in PROJECT_CONFIG.

## Rules

- Read-only by default. Mutate only on an explicit command.
- Status — freely (on command); step content — only deliberately. These are two different operations with different risk.
- ROADMAP doesn't duplicate the numbers from CONFIG.
- Do not run git.

## Related

- /start — reads ROADMAP (the Position) as part of entering a session.
- /snapshot — flips a step status during a session.
- /close — updates statuses, the Position, and the breakdown of the next stage.
