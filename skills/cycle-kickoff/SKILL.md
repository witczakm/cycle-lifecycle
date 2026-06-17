---
name: cycle-kickoff
description: Set up a new multi-session project from scratch — create the folder structure, copy the state-document templates, run the assumptions interview (including the roadmap stages), and leave the project ready for its first session. Use when the user types "/kickoff", "set up a project", "new multi-session project", "start a project from scratch", "begin a new project that will run for many sessions". This is a one-time-per-project command — in an existing project use /start. Do NOT use when "new project" means scaffolding a framework (npx create-react-app, cargo new, django-admin startproject) with no intent to run it across many sessions — then just help with the code.
---
<!-- cycle-lifecycle v2.3.0 -->

# /kickoff — set up a new project

## Goal

Every new project starts from an identical, proven structure. No ad-hoc. Why: a consistent structure from day one means the other skills (cycle-start, cycle-close…) work right away, and the project is "aware" of what each element is for. You run this ONCE.

## First: is this really a new project?

Check the target directory. If PROJECT_CONFIG.md or docs/HANDOFF.md already exist:
- adopt — add only the missing pieces (don't overwrite existing files),
- abort — stop.

Never overwrite existing documents blindly.

## Steps

1. **Assumptions interview** (max 5–7 questions in one turn, the rest → UNKNOWN with an owner):
   - Required to set up: name, codename/slug, target directory.
   - Required before work: project goal (1–2 sentences), the list of project stages (3–7 phrases for "the sequence" — feeds ROADMAP level 1), privacy boundaries.
   - Optional: git repo, license.
   - An unknown field → UNKNOWN with an owner and a deadline. An interrogation-style interview will be abandoned; UNKNOWN is better than an elegant hallucination (F4).

2. **Choose a structure profile** (see references/project-structure.md):
   - lite — README + PROJECT_CONFIG + docs/{HANDOFF,ROADMAP,LESSONS_CANON}. A small project/PoC.
   - standard — lite + the project instructions file (Claude: CLAUDE.md · Codex: AGENTS.md) + docs/{adr,specs,runbooks,reports} + skills/. A typical project.
   - regulated — standard + _ai_ops/ + runtime/audit/ + AGENTS.md. Production/audit.
   The rest of the directories are created lazily — when actually needed (F6).

3. **Create the directories** per the chosen profile.

4. **Copy and fill the templates** from assets/:
   - Substitute {PROJECT_NAME}, {owner}, the system date.
   - ROADMAP: enter the stages from the interview into the level-1 table (with exit gates), break ONLY stage 1 into steps (level 2). Set the Position to stage 1, step 1.
   - LESSONS_CANON starts with F1–F6 + an empty W section. Number project F-lessons from F10.
   - README: trim the table and the hierarchy to the chosen profile — remove rows that don't exist in this profile.

5. **Show the user** the structure + what went into each file.

6. **Prepare an "initial scaffold" commit command** (explicit paths, not -A). Don't run git.

7. **First /start** — report: "project set up, Position: stage 1/N · step 1/M, next move = …".

## Rules

- Don't overwrite an existing project. The "is it new" step is mandatory.
- Date from the system, not from memory.
- Don't guess — UNKNOWN with an owner.
- Do not run git.

## Skill materials

- references/project-structure.md — the structure map + hierarchy + profiles.
- assets/*.template.md — 5 document templates.

## Related

- /start — the first entry after kickoff and every subsequent session.
- /close, /snapshot, /lesson, /lesson-global, /roadmap — the project loop.
