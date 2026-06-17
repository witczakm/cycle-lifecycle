#!/usr/bin/env bash
# cycle-lifecycle — installer. Downloads the 7 skills STRAIGHT from GitHub and copies them to your agent.
#
# Usage (straight from GitHub, nothing to download manually):
#   curl -fsSL https://raw.githubusercontent.com/witczakm/cycle-lifecycle/main/install.sh | bash
#   ... | bash -s -- claude    # only ~/.claude/skills (Claude Code / Cowork)
#   ... | bash -s -- codex     # only ~/.agents/skills (OpenAI Codex)
#   ... | bash -s -- both      # both (default)
set -euo pipefail

REPO="witczakm/cycle-lifecycle"
BRANCH="main"
TARGET="${1:-both}"

command -v curl >/dev/null || { echo "Missing 'curl'."; exit 1; }
command -v tar  >/dev/null || { echo "Missing 'tar'.";  exit 1; }

tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
echo "→ Downloading cycle-lifecycle from github.com/$REPO ($BRANCH)…"
curl -fsSL "https://github.com/$REPO/archive/refs/heads/$BRANCH.tar.gz" | tar -xz -C "$tmp"

src="$(echo "$tmp"/*/skills)"
[ -d "$src" ] || { echo "Couldn't find the skills/ directory in the repo — check REPO/BRANCH."; exit 1; }

install_to() {
  dest="$1"; mkdir -p "$dest"; cp -R "$src"/cycle-* "$dest"/
  n="$(ls -d "$dest"/cycle-* 2>/dev/null | wc -l | tr -d ' ')"
  echo "✓ $dest  (cycle-* skills: $n)"
}

case "$TARGET" in
  claude) install_to "$HOME/.claude/skills" ;;
  codex)  install_to "$HOME/.agents/skills" ;;
  both)   install_to "$HOME/.claude/skills"; install_to "$HOME/.agents/skills" ;;
  *) echo "Unknown target: '$TARGET' (use: claude | codex | both)"; exit 1 ;;
esac

echo ""
echo "Done. Restart your agent, then:"
echo "  • Claude:  /kickoff"
echo "  • Codex:   \$cycle-kickoff   (and /skills to check the list)"
