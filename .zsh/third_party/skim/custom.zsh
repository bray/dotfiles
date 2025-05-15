# Strip the given flag from a list of flags
# e.g. strip_skim_flag "$SKIM_DEFAULT_OPTIONS" --bind
strip_skim_flag() {
  local input=$1 flag=$2
  perl -pe '
    s/\Q'"$flag"'\E\s*=?\s*((".*?"|\047.*?\047|\S+))\s*//g;
    s/\s+/ /g;
    s/^\s+|\s+$//g;
  ' <<< "$input"
}

# Override the default skim history widget
skim-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null

  # Filter out duplicates
  local gawk_filter='{ cmd=$0; sub(/^\s*[0-9]+\**\s+/, "", cmd); if (!seen[cmd]++) print $0 }'

  local skim_bindings=(
    "ctrl-r:toggle-search"  # Toggle between fuzzy and regex
    "ctrl-d:half-page-down"
    "ctrl-u:half-page-up"
  )

  local skim_opts=(
    --with-nth=2..                      # Only match against the command
    --nth=2..                           # Only match against the command
    --no-multi                          # Disable multiple selection
    --preview-window=:hidden            # Hide the preview window
    --height="${SKIM_TMUX_HEIGHT:-60%}" # Set the height of the skim window
    --bind="${(j:,:)skim_bindings}"     # Add custom key bindings
    --query="$LBUFFER"                  # Set the initial query to the current prompt text
  )

  filtered_opts=$(strip_skim_flag "$SKIM_DEFAULT_OPTIONS" --bind)

  selected=( $(fc -rl 1 | gawk "$gawk_filter" | SKIM_DEFAULT_OPTIONS=$filtered_opts $(__skimcmd) $skim_opts) )
  local ret=$?

  if [ -n "$selected" ]; then
    num=$selected[1]

    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi

  zle reset-prompt
  tput cnorm
  return $ret
}
