# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##### oh-my-zsh #####

ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""
DISABLE_AUTO_UPDATE="true"
export PAGER='less -Xr'
export EDITOR="nvim"

export TERM=xterm-256color
#[ -n "$TMUX" ] && export TERM=screen-256color


#export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem


plugins=(history-substring-search osx zsh-autosuggestions zsh-git-fzf)

source $ZSH/oh-my-zsh.sh

# Fixes issue with tab-complete sometimes not working
# (e.g. a tab would sometimes complete a capital letter instead of a list)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# fix up/down arrow? keep this here
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


##### Custom config #####

# Correct only commands, not arguments
unsetopt correct_all
setopt correct

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/libxml2/lib"
export CPPFLAGS="-I/usr/local/opt/libxml2/include"
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export ZSH_AUTOSUGGEST_MANUAL_REBIND='yes'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Enable autocomplete for the `aws` commands
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws


##### git-fzf Plugin Config #####

git-fzf-checkout-bindkey() { echo; git-fzf checkout; zle reset-prompt; }
zle -N git-fzf-checkout-bindkey
bindkey '^o' git-fzf-checkout-bindkey

git-fzf-log-bindkey() { git-fzf log; }
zle -N git-fzf-log-bindkey
bindkey '^l' git-fzf-log-bindkey


export PATH="$HOME/bin:$PATH"

##### Keep all below this at the bottom #####



export _ZO_DATA_DIR="$HOME/.local/share/zoxide"
export _ZO_ECHO=1
export _ZO_EXCLUDE_DIRS=""
eval "$(zoxide init zsh --no-cmd)"


# Include any additional config in ~/.zsh/
include_dir=~/.zsh
if [[ -d $include_dir ]]; then
  for file in ${include_dir}/**/*.zsh; do
    if [[ -e "$file" ]]; then
      source "$file"
    fi
  done
fi

# asdf Config
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# Shell prompt
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
