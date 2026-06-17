---
name: cycle-lesson-global
description: Capture a GLOBAL conclusion — one that holds in EVERY one of the user's projects, not just the current one — and save it to the global lessons file available to all projects. Use when the user types "/lesson-global", "global lesson", "this applies to all projects", "save globally", or when the learning is universal (a way of working with tools, a communication pattern, a process rule — not the specifics of one project). A global lesson ALWAYS requires the user's consent before saving. Do NOT use when "lesson" means something educational, or when the conclusion concerns only the current project — then use /lesson.
---
<!-- cycle-lifecycle v2.3.0 -->

# /lesson-global — a global conclusion

## Goal

Save a lesson that works beyond a single project into the global layer available to every one of the user's projects. A separate skill, because a global lesson affects OTHER projects — it must not be saved automatically. It always requires explicit consent.

## First, confirm it's really global

Test: "Would this lesson be true and useful in ANOTHER of the user's projects?"
- YES and it's universal → global, continue.
- It concerns only this project → use /lesson.
- Unsure → ask. When in doubt, choose project-level.

## Where the global lesson goes

The target depends on the environment (numbering is always GL-NNN):

| Environment | Target file | Write |
|---|---|---|
| Claude Code (CCT) | `~/.claude/context/lessons.md` | directly |
| Codex | `~/.codex/AGENTS.md` (the "cycle-lifecycle — global lessons" section) | directly, with consent; the sandbox may ask to approve a write outside the project directory |
| Cowork | no write to `~/.claude/` → a [CANDIDATE GLOBAL] marker + a ready command for CCT | in two steps |

Why `~/.codex/AGENTS.md`: it's the global instructions file that Codex reads at the start of EVERY session in every project — so the lesson actually takes effect. Add to it concisely (the global limit is ~32 KiB).

## Steps

1. Phrase the lesson:
   - Rule (1 sentence) + Why (the precedent) + Operational test.
   - Status: PROPOSED. Owner: the user. Date. Scope. Any contraindications.

2. Show the user the content + the rationale "why global" → wait for an OK. Don't go further without consent.

3. After consent — write depending on the environment:
   - **Claude Code / Codex (terminal):** add it directly to the target file (table above) as GL-NNN, under the section header. In Codex, writing to ~/.codex/AGENTS.md is outside the project directory — the sandbox may ask to approve; that's expected.
   - **Cowork (no global write):** insert a [CANDIDATE GLOBAL: to be saved via CCT] marker next to the lesson in docs/LESSONS_CANON.md and provide the ready content + a command for CCT.

4. After the actual GL-NNN write (via terminal or CCT):
   - Replace the [CANDIDATE GLOBAL] marker with [GLOBAL → GL-NNN].
   - Add GL-NNN to GLOBAL_LESSONS_BASELINE in PROJECT_CONFIG.md.

## Safety net

A candidate doesn't depend on human memory: on every entry /start scans LESSONS_CANON for [CANDIDATE GLOBAL] and reminds you with a ready command for CCT.

## Rules

- Always with consent. Never automatically.
- Cowork doesn't declare "saved globally" — that is done and confirmed by the terminal (Claude Code or Codex).
- The [GLOBAL → GL-NNN] marker may be inserted only after the actual GL-NNN write.

## Related

- /lesson — a project conclusion.
- /start — detects pending global candidates.
- /close — may invoke this logic when capturing lessons in bulk.
