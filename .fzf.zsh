# Set up fzf
source <(fzf --zsh)


# bray Customizations
# -------------------
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git --exclude tmp/ --exclude public/"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --multi --bind='ctrl-d:half-page-down,ctrl-u:half-page-up' --pointer='▶' --marker='✗'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Keep this split up so $FZF_CTRL_T_PREVIEW_OPTS can be used elsewhere, e.g. ~/.vimrc
export FZF_CTRL_T_PREVIEW_OPTS="(bat --color=always --style=numbers --line-range=:200 {} || tree -C {}) 2> /dev/null"
export FZF_CTRL_T_OPTS="--preview '${FZF_CTRL_T_PREVIEW_OPTS}'"

export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git --exclude tmp/ --exclude public/"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

export FZF_CTRL_R_OPTS="
  --style full
  --info inline-right

  # tomasr/molokai theme
  --color '
    fg:#F8F8F2
    fg+:#F8F8F2

    bg:#1B1D1E
    bg+:#293739

    hl:#7E8E91
    hl+:#F92672

    prompt:#F92672
    border:#808080
    header:#7E8E91
    info:#A6E22E

    spinner:#E6DB74
    pointer:#A6E22E
    marker:#F92672
  '

  # My theme modifications
  --color '
    hl:#F92672
  '

  --bind 'result:transform-list-label:
    if [[ -z \$FZF_QUERY ]]; then
      echo \"\$FZF_MATCH_COUNT items\"
    else
      echo \"\$FZF_MATCH_COUNT matches\"
    fi
  '
"
