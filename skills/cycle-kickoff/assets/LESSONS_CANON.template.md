# LESSONS_CANON — lessons canon {PROJECT_NAME}

**Version:** 1.0.0
**Created:** {YYYY-MM-DD HH:MM CEST}
**Last updated:** {YYYY-MM-DD HH:MM CEST}
**Author:** {author}
**Status:** LIVING DOCUMENT — canon of working principles. Every session reads this at the start, before work.

> **What this file is for:** so that mistakes which cost time **do not come back**. One source of truth about how we work.
> **How to read it:** each rule has a **Rule** (1 sentence), a **Why** (precedent), and an **Operational test** (how to check I am applying it).
> F = foundational (WHAT to build and in what order). W = executional (HOW we work in practice).

---

## Part I — Foundational rules (F)

> **Note:** F1–F6 are universal foundations pre-loaded in every new project.
> Add project lessons starting from W1 (executional) or F10 (project-specific foundational).

### F1 — Buy-before-build
**Rule:** Before you build: check whether a ready-made tool, library, or service already exists that does what you need. An hour of research > a week of implementation.
**Why:** Building a custom solution when a ready-made open-source one existed — lost days of work.
**Operational test:** Before implementing, did you check that no off-the-shelf solution exists? If not — STOP, do the research.

### F2 — Brief before implementation
**Rule:** Before writing code: one sentence on WHAT you are building + one sentence on WHY. No brief = implementing assumptions that may be wrong.
**Why:** A brief gives you a moment to catch an alternative or a flawed assumption before you put in the work.
**Operational test:** Can you say WHAT and WHY in two sentences before the first line of code exists?

### F3 — Foundation first
**Rule:** Build from the lowest layer in the stack. Do not build the UI before you have a working API. Do not write tests before you have working code.
**Why:** Building the superstructure before the foundation exists = work put into a component on a non-existent base.
**Operational test:** Does the layer I am relying on already exist and work?

### F4 — Facts, not assumptions
**Rule:** Verify in the code and the data, not from memory. Separate: facts | assumptions | risks | recommendations. Do not reassure without proof.
**Why:** A wrong assumption about the data, or a "works" status that depends on the executor's environment, gives a false sense of readiness.
**Operational test:** Does every claim about the code have `file:line`? Does a "green" status come from an independent re-run in a clean environment?

### F5 — Named patterns
**Rule:** Use proven, named patterns (Repository, Strategy, Circuit Breaker...) instead of inventing your own. Names let you communicate architecture.
**Why:** Solutions invented from scratch carry unforeseen risks that proven patterns no longer have.
**Operational test:** Can I name the pattern I am implementing and point to where it is used?

### F6 — Anti-overengineering
**Rule:** Do not build heavy components before they are needed. A slot for the future (an interface, an empty method) instead of an implementation. Simplify before you expand.
**Why:** Premature complexity = a maintenance cost with no value here and now.
**Operational test:** Does what I am building have a real consumer NOW?

---

## Part II — Executional rules (W) — from the practice of this project

> Here you add lessons via `/lesson`. The first will appear as W1.

{none — add via /lesson}

---

## Changelog

| Version | Date | Change |
|---|---|---|
| 1.0.0 | {YYYY-MM-DD} | Initial — F1-F6 (universal foundation) + empty W section. Template from /kickoff. |
