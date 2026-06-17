---
name: cycle-lesson
description: Capture a conclusion about THIS project and add it to the project's LESSONS_CANON (an executional lesson W or a foundational one F). Use when the user types "/lesson", "save a lesson", "note this for next time", "the takeaway from this", "do it differently next time", or when a repeatable, project-specific learning comes up during work. If the conclusion applies to EVERY one of the user's projects — use /lesson-global instead. Do NOT use when "lesson" means something educational (a lesson plan, a course, language learning, a music lesson) — this skill saves project conclusions, not learning materials.
---
<!-- cycle-lifecycle v2.3.0 -->

# /lesson — a project conclusion

## Goal

Capture a conclusion the moment it appears and add it to this project's docs/LESSONS_CANON.md — so the learning isn't lost by the end of the session and the mistake doesn't come back.

## First, settle the scope

Before you save: "Would this lesson be true in ANOTHER of the user's projects?"

- YES → global → stop and use /lesson-global.
- NO, but it holds for future sprints → project-level → save (steps below).
- NO, it only concerns the current task → local → don't save it to the canon, a note is enough. The canon is for lasting things.
- The boundary is unclear → ask the user.

## Steps (project lesson)

1. Phrase it in the canon format:
   - Rule — 1 sentence, what to do.
   - Why — the precedent: what happened that produced this lesson.
   - Operational test — how to check that I'm applying it.

2. Save it to docs/LESSONS_CANON.md:
   - A new entry W{next number} (executional — typical) or F{next from F10} (foundational — rare). F1–F6 are the baseline from /kickoff; number project F-lessons from F10 (F7–F9 = buffer and a visual boundary).
   - Determine the number by checking the highest existing one. In a parallel session — confirm the number with the user.
   - Add a changelog row + sync the header (Version + Last updated).

3. Show the user what you added (informational — no approval required).

## Rules

- A local lesson does not go into the canon — don't clutter it with one-offs.
- The Rule/Why/Test format is mandatory — without "why" and "test" a lesson becomes dead.
- Do not run git. Commit in bulk at /close.

## Related

- /lesson-global — a global conclusion (beyond the project, always with consent).
- /close — uses the same logic when capturing lessons in bulk.
