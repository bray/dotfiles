#!/usr/bin/env sh

# Run rubocop on only git staged files
# Can add an optional -a or -A flag
rubocop_staged() {
  staged_files=$(git diff --name-only --diff-filter=ACMR --cached | tr '\n' ' ')

  if [[ ! -z "$staged_files" ]]; then
    bundle exec rubocop $(echo $staged_files) $1
  else
    echo "No files are staged!"
  fi
}
