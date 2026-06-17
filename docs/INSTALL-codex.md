# Installation — OpenAI Codex

All 7 skills verified live on Codex v0.140.0 / gpt-5.5 (2026-06-17).

## 0. Got Codex?

```bash
npm install -g @openai/codex   # the @openai/codex package (not "codex")
codex --version
codex                          # first run: sign in with your ChatGPT account
```

## Option A — skills only (simplest, recommended to start)

```bash
mkdir -p ~/.agents/skills
cp -r skills/cycle-* ~/.agents/skills/
```

Restart Codex, type `/skills` (you should see all 7), then `$cycle-kickoff`.

## Option B — as a Codex plugin

The repo ships a manifest (`.codex-plugin/plugin.json`) and a sample marketplace (`marketplace.json`).

```bash
mkdir -p ~/.agents/plugins/cycle-lifecycle
cp -r .codex-plugin skills  ~/.agents/plugins/cycle-lifecycle/
cp marketplace.json         ~/.agents/plugins/marketplace.json
```

Then connect the plugin in Codex: type `$plugin-creator` and ask it to connect the plugin from `~/.agents/plugins/cycle-lifecycle` to the marketplace, or open the plugin directory and install it from the "Michał — personal plugins" marketplace. Restart Codex.

## How to call the skills

| Way | How |
|---|---|
| explicitly | `$cycle-start`, `$cycle-kickoff`, … |
| from the menu | `/skills` → pick one |
| in plain words | "where are we in the project?" |

`/start` as a slash command is a **Claude-ism** — in Codex use `$cycle-start`. `cycle-kickoff` fires **only** explicitly (`allow_implicit_invocation: false`), because it scaffolds structure.

## ⚠ Security — approval mode

Codex is an **agent**: it runs real commands and can reach **outside** the project directory.

- Set a sensible approval mode: `/approvals` in the session (or `--sandbox` / `approval_policy` in `~/.codex/config.toml`).
- **Read what you approve** — reject actions outside the current project or system commands (`pg_dump`, `npx`, `rm`, `docker`…) that you didn't knowingly request.
- The cycle skills only write state documents inside the project directory and **never run git**.

**Hygiene (optional).** With many skills installed, Codex truncates descriptions (a ~2% budget) and is eager to fire other skills. For pure cycle sessions you can disable the unused ones in `~/.codex/config.toml`:
```toml
[[skills.config]]
path = "/path/to/SKILL.md"
enabled = false
```

## /lesson-global on Codex

A global lesson lands in **`~/.codex/AGENTS.md`** (the "cycle-lifecycle — global lessons" section, numbered GL-NNN) — the global instructions file read at the start of every session in every project. Always with your consent; the sandbox may ask you to approve a write outside the project directory (this is expected).
