#!/usr/bin/env bash
# Clone or update Emil Kowalski's skills into vendor/ (local reference, git-ignored).
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p vendor
if [ -d vendor/emilkowalski-skills/.git ]; then
  git -C vendor/emilkowalski-skills pull --ff-only
else
  git clone https://github.com/emilkowalski/skills.git vendor/emilkowalski-skills
fi
echo "Skills available in vendor/emilkowalski-skills/skills:"
ls vendor/emilkowalski-skills/skills
