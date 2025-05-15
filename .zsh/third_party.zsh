plugins=(
)

for plugin in "${plugins[@]}"; do
  [[ -f "$plugin" ]] && source "$plugin"
done
