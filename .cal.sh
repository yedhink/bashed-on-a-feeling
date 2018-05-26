#!/bin/bash
echo -e "$(git diff --cached --name-only | wc -l)" "$(git diff --stat origin/master.. | wc -l)" "$(git diff --name-status | wc -l)" "$(git ls-files --others --exclude-standard | wc -l)"
