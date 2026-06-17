---
name: cycle-close
description: Wrap up a session of a multi-session project — gather what happened, update the state documents (including the position in the roadmap), capture lessons, and prepare a commit. Use at the end of a session when the user types "/close", "let's wrap up the session", "we're closing the thread", "that's it for today", "save progress and finish". Run it before the user closes the chat after real work. Do NOT use when "close" refers to a file, window, bracket, connection, resource, issue, or PR in code — this skill closes the work SESSION, not an object in a program.
---
<!-- cycle-lifecycle v2.3.0 -->

# /close — wrap up a session

## Goal

Leave the project in a clean state that the next session can enter without losing context: documents matching reality, the roadmap position current, and the code ready to pick up without cleaning up after the previous session.

## When NOT to run

An empty session (just discussion, no decisions/changes) — summarize verbally. Don't bump document versions or generate a commit for nothing — that clutters the history.

## Steps

1. **Gather facts from the session** (notes, not yet written to files):
   - What decisions were made, what was done/merged, what was verified.
   - Which roadmap steps closed (criterion: the "Verification" column is satisfied — not "seems done").
   - What conclusions/lessons. What the next move is and why.

2. **Verify against the live repo** (reading files, not git):
   - System date for the headers — don't copy it from memory or from the files.
   - What is actually in HANDOFF/ROADMAP/CONFIG.
   - Idempotency test: is the date of the last HANDOFF changelog entry today? Then this is a fix after an earlier /close: edit the existing entry, bump only the patch version.

3. **Update the state documents.** With EVERY edit to a document body, sync the header (Version + Last updated) and add a changelog row in the same move:
   - docs/HANDOFF.md — overwrite the snapshot: date · where we are (1 sentence) · recently closed · next move + why.
   - docs/ROADMAP.md — change the statuses of closed steps (status ONLY, don't delete content), move the Position. If a stage is DONE: break the NEXT stage into steps (only now — F6) and set the Position to its first step.
   - PROJECT_CONFIG.md — Current Sprint (status, branch, next decision, risks) + CURRENT_MILESTONE/CURRENT_SPRINT = the new Position. Bump the header (Version + date; CONFIG has no changelog).

4. **Lessons** — apply the /lesson (project) or /lesson-global (global) logic. Never save a global lesson yourself — show it and ask.

5. **Show the diff** — what you changed in which files.

6. **Prepare the commit command** with a built-in pre-flight:

   grep -n "Last updated" docs/HANDOFF.md docs/ROADMAP.md PROJECT_CONFIG.md
   # date = today? if not — the files didn't reach disk, do NOT commit
   git add docs/HANDOFF.md docs/ROADMAP.md PROJECT_CONFIG.md
   git commit -m "..."

   Don't run git — provide the commands; the user runs them in the terminal (Claude Code or Codex).

## Rules

- A false state is worse than none. Don't know? [TO BE FILLED IN], don't guess.
- A step is DONE = verification satisfied. Don't flip a status on a hunch.
- Don't claim "saved to disk". The pre-flight grep checks that where the truth is.
- Do not run git.

## Output (what the user sees)

1. Session summary (3–5 sentences) + new Position (Stage X/N · step Y/M).
2. List of updated documents with their new versions.
3. Lessons saved / global ones awaiting approval.
4. Command block: pre-flight grep + git add/commit.

## Related

- /snapshot — a lighter version (snapshot without a commit), for mid-session.
- /start — the next session reads what /close saved.
- /lesson, /lesson-global — classifying and saving conclusions.
