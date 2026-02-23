#!/bin/bash
# push_to_github.sh
# Usage: ./push_to_github.sh <remote_repo_url>
# Example: ./push_to_github.sh https://github.com/yourname/business-discovery-app.git

set -e

if [ -z "$1" ]; then
  echo "Error: remote repository URL required."
  echo "Usage: ./push_to_github.sh <remote_repo_url>"
  exit 1
fi

REMOTE_URL="$1"

# Ensure we are in repo root
cd "$(dirname "$0")"

# Add remote (replace if exists)
if git remote | grep -q "^origin$"; then
  git remote remove origin
fi

git remote add origin "$REMOTE_URL"

git branch -M main

echo "Pushing to $REMOTE_URL on branch main..."
git push -u origin main

echo "Done."
