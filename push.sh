#!/usr/bin/zsh

set -e

# Minimal PATH for cron
export PATH="/usr/bin:/bin"

REPO_DIR="$HOME/dotfiles"
BRANCH="main"

cd "$REPO_DIR" || exit 1

if [[ ! -d .git ]]; then
  echo "Not a git repository: $REPO_DIR"
  exit 1
fi

# Check if there are changes
if /usr/bin/git diff --quiet && /usr/bin/git diff --cached --quiet; then
  echo "No changes to commit."
  exit 0
fi

/usr/bin/git add .
/usr/bin/git commit -m "Weekly dotfiles update ($(date '+%Y-%m-%d'))"
/usr/bin/git push origin "$BRANCH"

