# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"


# bray Customizations
# -------------------
export FZF_DEFAULT_COMMAND="fd --type f --exclude .git"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --multi --bind='ctrl-d:half-page-down,ctrl-u:half-page-up'"

export FZF_CTRL_T_OPTS="--preview '(bat --color=always --style=numbers --line-range=:200 {} || tree -C {}) 2> /dev/null'"

export FZF_ALT_C_COMMAND="fd --type d --exclude .git"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

#export FZF_CTRL_R_OPTS='--sort'
#export FZF_CTRL_R_OPTS='--sort --exact'
