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

# Search dotfiles under $HOME: top-level dotfiles plus full recursion into
# dot-directories, minus toolchain and cache noise. Noise list lives in
# ~/.config/ripgrep/dotnoise; see the header there for details.
#
# Passing the dot entries as explicit args is deliberate. rg does not follow
# symlinks while walking, so a plain `rg ~` silently returns nothing from
# .zsh, .zshrc, .claude, or anything else symlinked out of ~/dotfiles.
# Explicit arguments are always followed.
#
# (N-.,-/) keeps only regular files and directories, following symlinks first
# (the `-`); the comma unions the two tests. This drops anything rg cannot read
# as a root: dangling symlinks and sockets such as ~/.obsidian-cli.sock.
rgdot() {
  setopt local_options extended_glob
  local -a roots
  roots=( $HOME/.[^.]*~*/(.asdf|.rustup|.npm|.yarn|.gem|.bundle|.cache|.pry.d|.Trash|*_history*|.lesshst|.wget-hsts)(N-.,-/) )
  rg --no-ignore-vcs --ignore-file "$HOME/.config/ripgrep/dotnoise" "$@" $roots
}
