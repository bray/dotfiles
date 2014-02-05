##### oh-my-zsh #####

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bray"
DISABLE_AUTO_UPDATE="true"
export EDITOR="vi"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export FREI0R_PATH=/usr/local/lib/frei0r-1

plugins=(git history-substring-search osx)

source $ZSH/oh-my-zsh.sh


##### Custom config #####

# Correct only commands, not arguments
unsetopt correct_all
setopt correct

alias ll='ls -lah'
alias lL='ls -lahL'
alias rm='rm -i'
alias top='top -o rsize'
alias locate='mdfind'
alias mysql='mysql -uroot'
alias gx='gitx --all'

alias vim='mvim -v'
alias vi='vim'

export BUNDLE_GEMFILE=Gemfile.local
#alias bundle_local='bundle install --gemfile Gemfile.local'
#alias server_local='BUNDLE_GEMFILE=Gemfile.local bundle exec rails s'
alias bundle_default='bundle install --gemfile Gemfile'

alias sc='ruby script/console'
alias rc_orig='spring rails console'
alias rc='BUNDLE_GEMFILE=Gemfile.local spring rails console'
alias rs='ruby script/spec -O spec/spec.opts'
#alias rspecs='ruby script/spec_server' # use 'spork' instead


# Much more config, specific to my setup
if [[ -e ~/.zshrc.local ]]; then source ~/.zshrc.local; fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
