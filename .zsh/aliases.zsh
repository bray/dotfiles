# Make my aliases work when sudo'ing
alias sudo='sudo '

alias l='exa -la --group --header --group-directories-first'
alias lL='ls -lahL'
alias rm='rm -i'
alias top='top -o rsize'
alias locate='mdfind'
alias mysql='mysql -uroot'
alias grep='grep -v grep | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'

alias vim='mvim -v'
alias vi='vim'
alias nv='nvim'
alias v='nvim'

alias g='git'
alias gx='gitx --all'
alias lz='lazygit'

alias be='bundle exec'
alias bundle_default='bundle install --gemfile Gemfile'

alias sc='ruby script/console'
alias rc='bundle exec rails console'

alias c='__zoxide_zi'
alias y='yazi'
alias awk='gawk'
alias cl='claude'
