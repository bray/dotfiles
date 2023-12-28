#!/usr/bin/env sh

get_staged_ruby_files() {
  git diff --name-only --diff-filter=ACMR --cached | grep -E '.rb$'
}

# Run rubocop on only git staged files
# Can add an optional -a or -A flag
rubocop_staged() {
  local staged_files=($(get_staged_ruby_files))

  if [[ ${#staged_files[@]} -gt 0 ]]; then
    echo "Running rubocop on these files:\n"
    printf '%s\n' "${staged_files[@]}"
    echo

    bin/rubocop "${staged_files[@]}" "$@"
  else
    echo "No Ruby files are staged!"
  fi
}

# Run rspec on only git staged files
rspec_staged() {
  local staged_files=($(get_staged_ruby_files))

  if [[ ${#staged_files[@]} -gt 0 ]]; then
    echo "Running rspec on these files:\n"
    printf '%s\n' "${staged_files[@]}"
    echo

    bin/rspec "${staged_files[@]}" "$@"
  else
    echo "No Ruby files are staged!"
  fi
}
