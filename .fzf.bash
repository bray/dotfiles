# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ubuntu/.fzf/bin* ]]; then
    export PATH="${PATH:+${PATH}:}/home/ubuntu/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ubuntu/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/ubuntu/.fzf/shell/key-bindings.bash"


# bray Customizations
# -------------------
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

#export FZF_CTRL_R_OPTS='--sort'
#export FZF_CTRL_R_OPTS='--sort --exact'

export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
