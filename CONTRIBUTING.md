# Contributing to cycle-lifecycle

Thanks for wanting to help. The most useful contributions:

- **Bad-trigger reports** — when a skill fired even though it shouldn't have (false positive), or didn't fire when it should have (false negative). Tell us: what you typed, in which environment (Claude Code / Cowork / web / Codex), and what happened.
- **Translations** into other languages (English, Czech, Ukrainian…). Skills are plain text files — translate `SKILL.md` and the triggers in `description`.
- **Experience from different environments** — especially Codex (across versions) and Cowork.

## Rules

- One skill = one job. Keep `description` concise (Codex truncates descriptions under a ~2% budget; put the important triggers and negatives up front).
- Every change to a state-document's content = version bump + a changelog row in the same move.
- Skills **never run `git`** automatically — they hand you a ready-to-paste command block.
- `agents/openai.yaml` is metadata for Codex only; Claude ignores it. Don't put logic there — the logic lives in `SKILL.md`.

## Testing skills

Test negative triggers with **control questions**, not commands — in Codex (an agent), a command-style prompt like "do X" will actually be carried out. Keep a sensible approval mode and work on a throwaway, git-tracked copy of the project.

## Before opening a PR

Read [CHANGELOG.md](CHANGELOG.md) to understand how the system evolved (Faza 1 → Faza 2 → Codex support). By submitting a PR you agree to the [MIT](LICENSE) license.
