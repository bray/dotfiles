# Setup fzf
# ---------
if [[ ! "$PATH" == *${HOME}/.fzf/bin* ]]; then
    export PATH="${PATH:+${PATH}:}${HOME}/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${HOME}/.fzf/shell/completion.bash" 2> /dev/null

_fzf_compgen_path() {
    fd --hidden --follow . "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --follow . "$1"
}


# Key bindings
# ------------
source "${HOME}/.fzf/shell/key-bindings.bash"


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

#export FZF_CTRL_R_OPTS='--sort'
#export FZF_CTRL_R_OPTS='--sort --exact'
