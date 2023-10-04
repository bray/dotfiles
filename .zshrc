##### oh-my-zsh #####

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bray"
#ZSH_THEME="zsh_git_timer"
DISABLE_AUTO_UPDATE="true"
export EDITOR="/usr/local/bin/mvim -v"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export FREI0R_PATH=/usr/local/lib/frei0r-1

export TERM=xterm-256color
#[ -n "$TMUX" ] && export TERM=screen-256color


#export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem


plugins=(history-substring-search osx zsh-autosuggestions zsh-git-fzf)

source $ZSH/oh-my-zsh.sh

# fix up/down arrow? keep this here
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


##### Custom config #####

# Correct only commands, not arguments
unsetopt correct_all
setopt correct

# Make my aliases work when sudo'ing
alias sudo='sudo '

alias l='exa -la --group --header --group-directories-first'
alias lL='ls -lahL'
alias rm='rm -i'
alias top='top -o rsize'
alias locate='mdfind'
alias mysql='mysql -uroot'
alias gx='gitx --all'

alias vim='mvim -v'
alias vi='vim'
alias nv='nvim'
alias g='git'

alias be='bundle exec'
alias bundle_default='bundle install --gemfile Gemfile'

alias sc='ruby script/console'
alias rc_orig='spring rails console'
alias rc='bundle exec rails console'
alias rs='ruby script/spec -O spec/spec.opts'


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


##### Keep all below this at the bottom #####

# More config, specific to my setup
if [[ -e ~/.zshrc.local ]]; then source ~/.zshrc.local; fi

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
eval "$(starship init zsh)"
