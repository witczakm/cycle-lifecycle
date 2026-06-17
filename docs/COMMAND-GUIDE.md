# Command guide — the cycle-lifecycle set

**Version:** 2.2.0  
**Who it's for:** anyone using the skill set to run multi-session projects

---

## The idea in one paragraph

A project spanning a dozen-plus sessions has one core problem: each new session
starts with no memory of the previous ones. This set solves that with 7 commands that together
form a loop: **enter → work → save state → exit → enter again next time**. The model always
knows which stage of the project you're at (e.g. "Stage 2/5") and which step within that stage
(e.g. "step 3/6"). There's nothing to "explain from scratch" at every session.

---

## The loop (what it looks like in practice)

```
First session:
  /kickoff  →  interview + structure + first /start

Every session after that:
  /start  →  work  →  (optionally /snapshot or /lesson along the way)  →  /close

When you want to check progress:
  /roadmap

When something worth keeping comes out of the work:
  /lesson  (for this project)
  /lesson-global  (for all projects)
```

---

## /kickoff — set up the project

**When to use:** once, at the very start of a new project that will span many sessions.

**What it does:**
1. Asks for the name, goal, and stages of the project (concisely — max 5-7 questions)
2. Creates the directory structure and the document files
3. Fills the ROADMAP with stages and breaks the first stage into steps
4. Fires the first `/start`

**Example use:**
```
/kickoff
```
The model will ask: "What should the project be called? What are the main stages (3-7 keywords)?"

**Important:**
- If the project already exists — say "adopt" to add the missing pieces without overwriting anything
- Structure profile: `lite` (small project/PoC), `standard` (typical), `regulated` (production/audit)

---

## /start — enter a session

**When to use:** at the start of EVERY session. Ideally the first command after opening the chat.

**What it does:**
1. Reads PROJECT_CONFIG, HANDOFF, ROADMAP, LESSONS_CANON
2. Checks whether the documents are consistent (drift-check)
3. Reports: **Position** (Stage X/N · step Y/M), what was last closed, the next move (ONE step)
4. Flags detected inconsistencies + pending global lessons to be saved

**Example use:**
```
/start
```
Expected output:
```
Position: Stage 2/5 "API implementation" · step 3/7 "Authorization endpoint"
Last closed: registration endpoint (step 2) — tests passed.
Next move: implement the /auth/login endpoint (step 3).
Drift: none. Pending global lessons: none.
```

**Doesn't fire when:** you type "start writing a function", "run npm start", "start the server"

---

## /close — end the session

**When to use:** at the end of every session, before closing the chat. Always after real work.

**What it does:**
1. Gathers what happened during the session
2. Updates HANDOFF (overwrites the snapshot), ROADMAP (step statuses, Position), PROJECT_CONFIG
3. Pulls out takeaways (optionally /lesson or /lesson-global)
4. Shows a diff + a ready-to-run git command block

**Example use:**
```
/close
```
Expected output:
```
Session: implemented the /auth/login endpoint (step 3) — tests passed.
New Position: Stage 2/5 · step 4/7 "JWT middleware"
Updated: docs/HANDOFF.md v1.4.0, docs/ROADMAP.md v1.3.0
Commit:
  grep -n "Last updated" docs/HANDOFF.md docs/ROADMAP.md
  git add docs/HANDOFF.md docs/ROADMAP.md PROJECT_CONFIG.md
  git commit -m "session: login endpoint, step 3/7 DONE"
```

**Don't use when:** the session was just a conversation with no decisions/changes — in that case, just summarize it in words.

---

## /snapshot — snapshot mid-session

**When to use:** after an important decision or a closed roadmap step, when you don't want to wait until the end of the session.

**What it does:**
1. Overwrites the Snapshot section in HANDOFF
2. If a step closed — flips its status and advances the Position in ROADMAP
3. Updates PROJECT_CONFIG if the live-state changed

**Example use:**
```
/snapshot
```
or during a long session, after a specific decision:
```
Decided: we're using Redis instead of Memcached. /snapshot
```

**/snapshot vs /close:**
| | /snapshot | /close |
|---|---|---|
| When | Mid-session | At the end of the session |
| Lessons | No | Yes |
| Commit | No (batched later) | Yes |
| Scope | HANDOFF + CONFIG + step in ROADMAP | Everything |

**Doesn't fire on:** test snapshots (Jest/Vitest), VM snapshots, database backups

---

## /roadmap — progress overview

**When to use:** when you want a bird's-eye view — where we are in the whole project and what's left.

**What it does:**
1. Shows the Position (Stage X/N · step Y/M)
2. Step statuses for the current stage (DONE/IN_PROGRESS/TODO)
3. The sequence of remaining stages

**Example use:**
```
/roadmap
```
Expected output:
```
Position: Stage 2/5 "API implementation" · step 3/7 "Authorization endpoint"

Stage 2 — steps:
[DONE] 2.1 Router configuration
[DONE] 2.2 Registration endpoint  
[IN_PROGRESS] 2.3 Authorization endpoint
[TODO] 2.4 JWT middleware
[TODO] 2.5 Refresh token
[TODO] 2.6 Logout
[TODO] 2.7 Integration tests

Further stages: 3-Frontend (TODO) · 4-E2E tests (TODO) · 5-Deploy (TODO)
```

**Updating the roadmap:**
```
/roadmap update let's reorder: 2.5 (refresh token) before 2.4 (middleware)
```

**Don't use for:** a client's product roadmap, an external company's strategy

---

## /lesson — record a project takeaway

**When to use:** when something specific to this project comes up — "so I don't fall back into this mistake".

**What it does:**
1. Asks: does this lesson apply ONLY to this project, or to all of them? (scope routing)
2. Phrases it in the format: **Rule** + **Why** + **Operational test**
3. Appends it to docs/LESSONS_CANON.md

**Example use:**
```
/lesson
I lost an hour because I didn't check whether Redis was running before the test.
```
The model will record:
```
### W7 — Verify dependencies before testing
Rule: Before running integration tests, check that external services (Redis, DB) are active.
Why: Lost 1h diagnosing a test that failed because Redis was stopped.
Test: `docker ps | grep redis` before `npm test`, or a guard in setup.ts.
```

**/lesson vs /lesson-global:**
- `/lesson` → "this specific project", saved without asking
- `/lesson-global` → "every project", always asks for consent

---

## /lesson-global — record a global takeaway

**When to use:** when the takeaway is general enough to be useful across ALL your projects.

**What it does:**
1. Checks: is it really global? (test: "true in another project?")
2. Phrases the lesson
3. Asks for consent (always — no save without consent)
4. In Cowork: inserts a `[CANDIDATE GLOBAL]` marker and hands you a command for CCT
5. In CCT: writes to `~/.claude/context/lessons.md` as GL-NNN

**Example use:**
```
/lesson-global
Always check the API version in the docs before implementing — 6 months passed and the endpoint changed.
```

**Important:**
- In Cowork: you then have to run the command in CCT for the lesson to actually reach the global layer
- `/start` at your next entry will remind you about pending candidates if you forget

---

## Rules worth knowing

**1. One step at a time**  
`/start` always gives ONE next step. Don't try to plan 5 steps ahead in a single session — that leads to half-done work and undocumented state.

**2. DONE only with proof**  
A step in ROADMAP gets DONE status only when the "Verification" column is satisfied (test passed, file exists, smoke test OK). "Seems to work" is not DONE.

**3. Changelog on every version bump**  
When the model updates a document header (Version + date), it always adds a changelog row too. Without it, `/start` will report drift. If you see a weird "drift alarm" — check whether the changelog matches the header.

**4. You don't have to remember anything between sessions**  
That's the whole point of the system. `/start` will read the current state. Type commands, do the work, `/close` — and forget it until next time.

---

## A typical workday

```
# Morning — entering
/start
→ "Position: Stage 2/5 · step 3/7. Next move: authorization endpoint."

# Work (normal conversation with Claude)
...implementation...

# Midway — a key architectural decision
/snapshot

# End of day
/close
→ diff + git add/commit block (I paste it into the terminal)
```

---

## Questions and answers

**Q: Do I have to type /start manually?**  
A: No. The cycle-start skill fires automatically when Claude detects you're starting a session in a project (returning after a break, "where were we"). But typing /start is always safe.

**Q: What if I don't commit for several sessions?**  
A: No harm. The commit is a one-off command you can copy from the last /close. You can let them pile up and run them in a batch.

**Q: Do the skills work with GitHub/Jira/Notion?**  
A: These skills manage only the project's local documents (Markdown in the repo). Integration with external tools is a separate topic.

**Q: Can I use /start without /close from the previous session?**  
A: Yes, but you'll get a drift alarm if the documents are stale. The model will say "HANDOFF is from 3 days ago" — treat that as a signal to do a manual /snapshot before working.

**Q: Do these skills work in the Claude API (without Cowork/CCT)?**  
A: They do, but you have to install them locally in the project (Option C in the installation guide) and make sure you have a file read/write tool enabled (computer_use or bash_tool).
