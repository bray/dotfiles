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


plugins=(git history-substring-search osx zsh-autosuggestions zsh-git-fzf)

source $ZSH/oh-my-zsh.sh

# fix up/down arrow? keep this here
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


##### Custom config #####

# Correct only commands, not arguments
unsetopt correct_all
setopt correct

alias l='exa -la --group --header'
alias lL='ls -lahL'
alias rm='rm -i'
alias top='top -o rsize'
alias locate='mdfind'
alias mysql='mysql -uroot'
alias gx='gitx --all'

alias vim='mvim -v'
alias vi='vim'

# Git shortcuts
alias gx='gitx --all'
alias gci='git ci'
alias gt='git temp'
alias gs='git stash'
alias grh='git rh'
alias ga='git add .'
alias gpl='git pull'
alias gmf='git mf'

#alias bundle_local='bundle install --gemfile Gemfile.local'
#alias server_local='BUNDLE_GEMFILE=Gemfile.local bundle exec rails s'
export BUNDLE_GEMFILE=Gemfile.local
alias bundle_default='bundle install --gemfile Gemfile'

alias sc='ruby script/console'
alias rc_orig='spring rails console'
#alias rc='BUNDLE_GEMFILE=Gemfile.local spring rails console'
alias rc='BUNDLE_GEMFILE=Gemfile.local bundle exec spring rails console'
alias rs='ruby script/spec -O spec/spec.opts'
#alias rspecs='ruby script/spec_server' # use 'spork' instead

alias sync_evernote='/code/geeknote/gnsync.py --path ~/Documents/EvernoteGeeknote'
alias evernote_sync='sync_evernote'


# Much more config, specific to my setup
if [[ -e ~/.zshrc.local ]]; then source ~/.zshrc.local; fi

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
