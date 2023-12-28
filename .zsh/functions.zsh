#!/usr/bin/env sh

get_staged_ruby_files() {
  git diff --name-only --diff-filter=ACMR --cached | grep -E '.rb$'
}

# Run a command on only git staged Ruby files
run_cmd_on_staged_files() {
  local cmd=$1
  shift
  local staged_files=($(get_staged_ruby_files))

  if [[ ${#staged_files[@]} -gt 0 ]]; then
    echo "Running ${cmd} on these files:\n"
    printf '%s\n' "${staged_files[@]}"
    echo

    "$cmd" "${staged_files[@]}" "$@"
  else
    echo "No Ruby files are staged!"
  fi
}

# Can add an optional -a or -A flag
rubocop_staged() {
  run_cmd_on_staged_files bin/rubocop "$@"
}

rspec_staged() {
  run_cmd_on_staged_files bin/rspec "$@"
}
