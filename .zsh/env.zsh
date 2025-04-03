export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"

# Stop Homebrew from autoupgrading everything when something in their dependency tree changes
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1

# Don't know what changed, but this is now needed
# Somehow, $TMUX is not getting set outside of tmux, which causes a
# "no current client" error
[ -z "$TMUX" ] || unset TMUX
