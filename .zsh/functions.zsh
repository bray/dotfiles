#!/usr/bin/env sh

get_staged_ruby_files() {
  git diff --name-only --diff-filter=ACMR --cached | grep -E '.rb$'
}

# Run rubocop on only git staged files
# Can add an optional -a or -A flag
rubocop_staged() {
  staged_files=($(get_staged_ruby_files))

  if [[ ${#staged_files[@]} -gt 0 ]]; then
    bin/rubocop "${staged_files[@]}" $1
  else
    echo "No files are staged!"
  fi
}
