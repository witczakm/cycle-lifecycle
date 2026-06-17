# Changelog

All notable changes to cycle-lifecycle are documented here.

---

## [2.4.0] — 2026-06-17

### Added
- **OpenAI Codex support (dual-compatible).** The same `SKILL.md` now works in both Claude and Codex.
- `agents/openai.yaml` in each of the 7 skills — UI metadata + invocation policy for Codex (Claude ignores the file). `cycle-kickoff` is set to `allow_implicit_invocation: false` (explicit `$cycle-kickoff` only).
- The package as a **Codex plugin**: `.codex-plugin/plugin.json` + `marketplace.json`.
- `docs/INSTALL-codex.md` — installing on Codex (skills or plugin) + a security section (approval mode).
- `CONTRIBUTING.md` and a README rewritten for both platforms (Claude + Codex), friendly to AI newcomers.
- `/lesson-global` on Codex writes to `~/.codex/AGENTS.md` (global instructions read at the start of every session).

### Changed
- Generalized the platform-coupled fragments in the skills: "CCT" → "terminal (Claude Code / Codex)"; `cycle-kickoff` annotates the project instructions file as CLAUDE.md (Claude) / AGENTS.md (Codex); `cycle-lesson-global` now carries a tri-platform table of write targets.
- `docs/INSTRUKCJA-INSTALACJI.md` → `docs/INSTALL-claude.md`; installation split per platform.
- README: version bump 2.3.0 → 2.4.0.

### Verified
- All 7 skills tested live: Claude (Cowork) and Codex v0.140.0 / gpt-5.5 (2026-06-17) — explicit, implicit, and negative triggers, plus correctness of state-document writes. Full PASS.

---

## [2.3.0] — 2026-06-17

### Fixed
- LESSONS_CANON.template: F1–F6 generalized (BidSentinel references removed)
- README: CCT install — a single `cp -r skills/cycle-*` command instead of 7 separate ones
- README: Skills badge URL — corrected link to docs.anthropic.com
- README: Cowork UI reference — removed hardcoded icon location

### Added
- README: "First 15 minutes — quickstart" section with a literal transcript
- README: comparison table of the lite/standard/regulated profiles
- README: minimum viable workflow for small projects
- README: note for Cowork users without CCT regarding /lesson-global
- All SKILL.md files: version `<!-- cycle-lifecycle v2.3.0 -->`
- cycle-roadmap: extended negative trigger
- HANDOFF.template: HTML comment marking the AI-model instructions section (P3.1)
- README: the rule "don't run an entire project in a single thread" (token/quality rationale + context rot) plus an FAQ entry

### Changed
- cykl-zaloz → cycle-kickoff — folder name, the `name:` field in SKILL.md, and references in README and docs/INSTRUKCJA-INSTALACJI.md (P3.2)
- README: version badge 2.2.0 → 2.3.0

## [2.2.0] — 2026-06-17

### Changed
- Rename `nsos-*` → `cycle-*` (universal prefix, neutral to code context)
- Rename `nsos-handoff` → `cycle-snapshot` (avoids collision with test/VM snapshots)
- Added **negative triggers** to every skill description ("Do NOT use when…")
- Added public GitHub release with professional README, installation guide, command guide

### Added
- `INSTRUKCJA-INSTALACJI.md` — 3-option installation guide (CCT global / Claude.ai Settings / local)
- `PRZEWODNIK-KOMEND.md` — per-command reference with examples, diffs, Q&A

---

## [2.1.0] — 2026-06-10

### Fixed (CRITICAL)
- Mandatory changelog row on every header bump (`/handoff`, `/close`) — without it `/start` drift-check produced false alarms on every correctly-executed session

### Added
- **Two-level position awareness** (Stage X/N · step Y/M) in ROADMAP template and all skills
- `/start` step 0: guard for non-lifecycle directories (no `PROJECT_CONFIG.md` → propose `/kickoff`)
- `/start` drift-check: scans `LESSONS_CANON.md` for `[CANDIDATE GLOBAL]` markers and surfaces them with CCT command
- ROADMAP: `Verification` column — step only flips to DONE when verifiable criterion is met
- ROADMAP: `Exit gate` column on stage table — stage only DONE when gate is satisfied
- `GLOBAL_LESSONS_BASELINE` loop closed: CCT writes GL-NNN to field after confirmed global save
- Conflict resolver for HANDOFF ↔ ROADMAP in `project-structure.md` and `README.template`
- Pre-flight `grep` in `/close` commit block (verifies files actually wrote to disk)
- Idempotency test in `/close` (today's changelog date = patch-only bump, no duplicate rows)
- `/kickoff` interview limit (max 5-7 questions/turn, rest → `UNKNOWN`)
- Project-local F-lessons numbered from F10 (F1-F6 = universal baseline, F7-F9 = visual buffer)

### Fixed
- `/handoff` snapshot model: overwrite-only (was append; accumulation → log, then `/close` overwrote it losing interim decisions)
- `PROJECT_CONFIG.template`: added minimal version header (skills said "bump CONFIG header" but template had no header)
- `README.template`: profile-aware pruning instruction (lite profile must not reference non-existent `docs/adr/`, `CLAUDE.md`)

---

## [2.0.0] — 2026-06-09

### Changed
- Full de-escalation from Faza 1 (11 commands, Python scripts, transactional rollback, JSON manifests) to Faza 2: **prose-only skills**, zero code, zero automation without human approval
- Aligned with Anthropic Agent Skills best practices format

### Added
- 7 skills: `/start`, `/close`, `/handoff`, `/roadmap`, `/lesson`, `/lesson-global`, `/kickoff`
- 5 document templates (HANDOFF, ROADMAP, LESSONS_CANON, PROJECT_CONFIG, README)
- `project-structure.md` reference (source-of-truth hierarchy, profiles)
- IoC pattern for global lessons (Cowork → CCT handoff, no hanging markers)
- Common principles from BidSentinel lessons F1-F6 (pre-loaded in every new project)
