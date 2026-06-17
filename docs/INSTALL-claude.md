# Installation — Claude (Code / Cowork / web)

Three Claude environments. Pick yours.

## Claude Code (terminal) — recommended

```bash
# 1. Clone the repo — copy the URL from the green "Code → HTTPS" button on the repo page
git clone https://github.com/witczakm/cycle-lifecycle.git
cd cycle-lifecycle

# 2. Install the skills globally
mkdir -p ~/.claude/skills
cp -r skills/cycle-* ~/.claude/skills/

# 3. Verify
ls ~/.claude/skills/
# cycle-kickoff  cycle-lesson  cycle-lesson-global  cycle-snapshot
# cycle-roadmap  cycle-start   cycle-close
```

Open a new session in your project directory and type `/kickoff`.

## Claude Cowork (desktop)

**Settings → Capabilities → Skills → Add skill.** Add each of the 7 `skills/cycle-*` folders separately. Restart Cowork, open a conversation, and type `/kickoff`.

> `/lesson-global` (the global write) in Cowork requires Claude Code to actually write to `~/.claude/` — Cowork inserts a "candidate" and hands you a ready-to-paste command for the terminal. The other 6 commands work fully.

## Claude.ai (web / mobile)

**Settings → Capabilities → Skills → Add skill** (each folder separately). Limitation: the web has no file access — it can help with planning, but writing to project files requires Claude Code or Cowork.

## Updating

```bash
rm -rf ~/.claude/skills/cycle-*
cp -r skills/cycle-* ~/.claude/skills/
```

Have an old `nsos-*` version? Remove it to avoid conflicts:
```bash
rm -rf ~/.claude/skills/nsos-*
```

## Troubleshooting

- **A skill doesn't fire** — restart the session (skills load at startup). Check: `ls ~/.claude/skills/cycle-start/` (it should contain `SKILL.md`).
- **It fires at the wrong moment** — say so plainly: "don't use /start here, we're writing code". Every skill has a "Do NOT use when…" clause in its description.
- **The skills don't show up in Cowork** — add each of the 7 folders separately (not the whole `skills/` directory), then restart Cowork.
