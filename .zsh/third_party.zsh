plugins=(
  "${ZSH_THIRD_PARTY_DIR}/skim/init.zsh"
)

for plugin in "${plugins[@]}"; do
  [[ -f "$plugin" ]] && source "$plugin"
done
