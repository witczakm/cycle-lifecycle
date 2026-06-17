# cycle-lifecycle

> **Project memory for AI agents.** Run a single project across dozens of sessions with Claude or Codex — at the start of every session the model knows where you left off and what comes next.
>
> 🇵🇱 Wersja polska / Polish version: **[witczakm/cykl-lifecycle](https://github.com/witczakm/cykl-lifecycle)**

[![Version](https://img.shields.io/badge/version-2.4.0-blue)](CHANGELOG.md)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Platforms](https://img.shields.io/badge/platforms-Claude%20Code%20%C2%B7%20Codex%20%C2%B7%20Cowork-orange)](#installation)
[![Format](https://img.shields.io/badge/format-Agent%20Skills-blueviolet)](https://agentskills.io)

---

## Why it exists

AI agents (Claude Code, OpenAI Codex) don't remember previous conversations. On a project that runs for weeks, you start every session by explaining it all over again: *"where did we leave off, what's done, what's next…"*. That wastes time — and often quality too, because running an entire project in one giant thread degrades the answers and burns tokens.

**cycle-lifecycle** is 7 commands that give a project memory. You save the state to files after each session and load it at the start of the next one. Instead of re-explaining context, you type `/start` and in half a minute you have the full picture: which stage you're on, what was recently closed, and the **one** next move.

## How it works — the loop

```
   /kickoff   (once — sets up the project)
      │
      ▼
   /start  ──►   work   ──►  /close          ◄── this is every session
 (load state)            (save state)
      ▲                          │
      └──────────────────────────┘
        the next session reads what the previous one saved
```

State lives in **files** in the project (`HANDOFF`, `ROADMAP`, `LESSONS`), not in the chat scroll. So you can close the conversation, come back a week later, type `/start`, and continue without losing context.

## Is it for you?

✅ **Yes**, if:
- the project will run longer than 2–3 sessions,
- you're working on something complex (an app, documentation, research, analysis),
- you want to be sure progress is saved and nothing gets lost.

❌ **Probably not**, if:
- it's a one-off, one-time task,
- the project is simple and you remember it well.

---

## New to AI? One minute of theory

If these tools are new to you — here's everything you need to understand the rest:

- **AI agent in the terminal** — a program that talks to you and edits files on your computer. Two popular ones: **Claude Code** (Anthropic) and **OpenAI Codex**. **Claude Cowork** is the desktop version, no terminal.
- **Skill** — an instruction file (`SKILL.md`) that teaches the agent one repeatable thing. The agent runs it on its own when it matches what you type. It's an open standard ([agentskills.io](https://agentskills.io)) — the same format works in Claude and in Codex.
- **cycle-lifecycle** = 7 such skills that together give a project memory between sessions.

You type the commands (`/start`, `/close`…) right in the conversation with the agent.

---

## The 7 commands

| Command | When | What it does |
|---|---|---|
| `/kickoff` | once, at the project's start | sets up the structure and asks about the stages |
| `/start` | at the start of **every** session | loads state, tells you where you are |
| `/close` | at the end of each session | saves progress, prepares a commit |
| `/snapshot` | after an important mid-session decision | a light state save |
| `/roadmap` | when you want to see progress | shows stages and steps |
| `/lesson` | when you draw a conclusion from the work | saves the learning to the project |
| `/lesson-global` | when the conclusion applies to all projects | saves it globally (with consent) |

> **Claude:** you type `/start`, or just describe what you want.
> **Codex:** you call it with `$name` (e.g. `$cycle-start`) or in a sentence ("where are we in the project?"). `/start` as a slash doesn't work in Codex — use `$cycle-start`.

---

## Installation

### ⚡ One command — straight from GitHub (Claude Code / Codex)

**Codex + Claude (both):**

```bash
curl -fsSL https://raw.githubusercontent.com/witczakm/cycle-lifecycle/main/install.sh | bash
```

**Codex only:**

```bash
curl -fsSL https://raw.githubusercontent.com/witczakm/cycle-lifecycle/main/install.sh | bash -s -- codex
```

**Claude only:**

```bash
curl -fsSL https://raw.githubusercontent.com/witczakm/cycle-lifecycle/main/install.sh | bash -s -- claude
```

The script downloads the 7 skills **straight from the repo** and copies them to `~/.claude/skills` and/or `~/.agents/skills` — nothing to download by hand. Then restart your agent and type `/kickoff` (Claude) or `$cycle-kickoff` (Codex). No Codex yet? `npm install -g @openai/codex`.

> Want to see what you're running? Open [`install.sh`](install.sh) — it's a dozen lines. (`curl … | bash` runs code from the network; only do this with trusted repos — e.g. your own.)

### ▶ Claude Cowork (desktop) — simplest, one file

Download **[`cycle-lifecycle.plugin`](https://github.com/witczakm/cycle-lifecycle/raw/main/cycle-lifecycle.plugin)** (click = file download) and **open it in Cowork** — drag the file into a conversation; an **Install** button appears that loads all 7 skills at once. Then type `/kickoff`. No repo download, no adding folders one by one.

Fallback (manual): **Settings → Capabilities → Skills → Add skill** → add the 7 `skills/cycle-*` folders one at a time.

### ▶ Claude.ai (web / mobile)

**Settings → Capabilities → Skills → Add skill** (the 7 folders separately). The web version has no file access — it helps with planning, but writing to project files requires Cowork, Claude Code, or Codex.

> Details and troubleshooting: **[docs/INSTALL-claude.md](docs/INSTALL-claude.md)** · **[docs/INSTALL-codex.md](docs/INSTALL-codex.md)**.

---

## First 15 minutes

**Session 1 — set up the project (~5 min).** Type `/kickoff` (or `$cycle-kickoff` in Codex). The agent asks a few things:

```
1. Project name? (e.g. "My App" / "my-app")
2. Goal? (1–2 sentences — what you're building and for whom)
3. Main stages? (3–7 phrases for "the sequence", e.g.:
   Planning → Database → Backend → Frontend → Tests → Deploy)
4. Where to create files? (path to the project directory)
5. Profile? (lite = 3 files / standard = full structure / regulated = with audit)
```

Don't know something? Type "I don't know" — the agent saves it as UNKNOWN to fill in later. After your answers it creates the structure, fills the ROADMAP with your stages, and immediately tells you the first step.

**Every following session (~30 seconds to enter).** Open a new conversation and type `/start`:

```
Position: Stage 1/4 "Planning" · step 1/3 "Gather requirements"
Recently closed: project set up — structure ready ✓
Next move: define the functional requirements (step 1.1)
Drift: none.
```

You work as usual. At the end type `/close` — you get a summary and a ready `git add + commit` block to copy.

---

## The most important rule: don't run a whole project in one thread

The most common beginner mistake: a whole, multi-week project in one endless conversation. You pay for it in **quality and tokens**:

- The model is stateless — with every message it gets the **entire** conversation again. The longer the thread, the more expensive each turn (cost grows ~quadratically).
- In a long context, quality drops ("context rot"): the model reaches less reliably for information in the middle of the thread and gets lost in the noise.

**The good habit:** a new conversation for each session — `/start` on the way in, `/close` on the way out. State lives in files, so a fresh thread loses nothing. The chat is a "workbench" for one session; the project's memory is in the files.

---

## Security (especially in Codex)

Codex is an **agent** — it runs real commands and can reach outside the current directory. Before you start on a real project:

- set a sensible approval mode (`/approvals` in the session),
- **read what you approve** — reject actions outside the project or system commands (`pg_dump`, `npx`, `rm`…) you didn't deliberately ask for.

The cycle skills themselves are safe: they only edit the state documents in the project directory and **never run git** — they just give you a ready command block to paste.

---

## What gets created in your project

After `/kickoff`:

```
project/
├── PROJECT_CONFIG.md      ← parameters + live state (what's in progress now)
└── docs/
    ├── HANDOFF.md         ← snapshot "where we are + next step"
    ├── ROADMAP.md         ← progress: stages + steps + Position
    └── LESSONS_CANON.md   ← lessons canon (F1–F6 + yours)
```

| File | Updated by | Rule |
|---|---|---|
| `PROJECT_CONFIG.md` | `/snapshot`, `/close` | live state: branch, status, decisions |
| `docs/HANDOFF.md` | `/snapshot`, `/close` | always overwritten (state "now") |
| `docs/ROADMAP.md` | `/snapshot`, `/roadmap`, `/close` | step statuses, Position |
| `docs/LESSONS_CANON.md` | `/lesson` | appended, never overwritten |

---

## FAQ

**Do I have to type `/start` manually?**
No. The agent usually fires it on its own when it detects you're back in a project. But typing `/start` is always safe.

**Does it work without a terminal?**
Yes — in Claude Cowork (desktop) and Claude.ai (web) via Settings → Capabilities. On the web without file access.

**Can I use it with other skills?**
Yes. The `cycle-` prefix and the trigger phrases are designed to coexist with other technical skills.

**Where does `/lesson-global` (a global lesson) go?**
Claude Code → `~/.claude/context/lessons.md`. Codex → `~/.codex/AGENTS.md`. Cowork → a marker + a ready command for the terminal. Always with your consent.

---

## Repository structure

```
cycle-lifecycle/
├── README.md
├── CHANGELOG.md
├── LICENSE
├── CONTRIBUTING.md
├── install.sh                   # one-command install (curl | bash)
├── cycle-lifecycle.plugin       # one-click install for Claude Cowork
├── .codex-plugin/
│   └── plugin.json              # Codex plugin manifest
├── marketplace.json             # personal Codex marketplace (install as a plugin)
├── skills/                      # 7 skills (dual-compatible: Claude + Codex)
│   ├── cycle-start/  · cycle-close/  · cycle-snapshot/  · cycle-roadmap/
│   ├── cycle-lesson/ · cycle-lesson-global/
│   └── cycle-kickoff/           # + assets/ (5 templates) + references/
│       └── agents/openai.yaml   # each skill has Codex metadata (Claude ignores it)
└── docs/
    ├── INSTALL-claude.md        # install: Claude Code / Cowork / web
    ├── INSTALL-codex.md         # install: Codex (skills or plugin) + security
    └── COMMAND-GUIDE.md         # per-command guide with examples
```

---

## How it works technically

The skills are `SKILL.md` files following the [open Agent Skills standard](https://agentskills.io). The agent loads only their name + description at startup (progressive disclosure), and the full body only when a command or context matches a trigger. Each skill has a "Do NOT use when…" clause that guards against firing at the wrong moment.

The architecture follows patterns for long-running agents: a list of steps with statuses (only the status is edited), one step per session, a "load state" protocol on the way in (`/start`), and a clean save + commit at the end (`/close`). **No automation without your consent** — every change is shown as a diff, and you run `git commit` yourself.

Dual-compatible by design: the same `SKILL.md` works in Claude and Codex. The extra `agents/openai.yaml` (metadata + invocation policy) is read only by Codex — Claude ignores it. Validation status: all 7 skills tested live on Claude and on Codex (gpt-5.5) — see the [CHANGELOG](CHANGELOG.md).

---

## Contributing

Issues and PRs welcome — especially reports of wrong triggers (false positive / negative), translations into other languages, and experiences across environments. Details: [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE) © 2026 Michał Witczak
