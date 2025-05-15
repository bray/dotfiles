# Set default options
preview='([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -L 2 -a -C {} | less || echo {} 2> /dev/null | head -20))'
export SKIM_DEFAULT_OPTIONS="--color=16 --reverse --inline-info --no-multi --height=60% --tiebreak=index --bind='?:toggle-preview' --preview='$preview'"


# Initialize skim
dir=${0:A:h}

files=(
  "$dir/completion.zsh"
  "$dir/key-bindings.zsh"
)

for file in "${files[@]}"; do
  [[ -f "$file" ]] && source "$file"
done
