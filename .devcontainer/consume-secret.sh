#!/usr/bin/env bash
set -euo pipefail

marker=""
case "${GH_R24_CODESPACE_USER_SECRET:-}" in
  GH-R24-CODESPACE-OWNER-VALUE-8E42C1B7)
    marker="GH-R24-CODESPACE-OWNER-CONSUMER-8E42C1B7"
    ;;
  GH-R24-CODESPACE-UAT-VALUE-4A79D2E6)
    marker="GH-R24-CODESPACE-UAT-CONSUMER-4A79D2E6"
    ;;
esac

if [[ -n "$marker" ]]; then
  gh api "repos/${GITHUB_REPOSITORY}/issues" \
    -f title="$marker" \
    -f body="Created by owned Codespaces secret consumer."
fi
