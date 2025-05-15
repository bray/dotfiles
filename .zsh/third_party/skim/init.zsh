preview='([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -L 2 -a -C {} | less || echo {} 2> /dev/null | head -20))'
export SKIM_DEFAULT_OPTIONS="--color=16 --reverse --inline-info --no-multi --height=60% --tiebreak=index --bind='?:toggle-preview' --preview='$preview'"

# Initialize skim
dir=${0:A:h}

for file in "$dir"/*.zsh; do
  if [[ -r "$file" && "${file:t}" != "init.zsh" ]]; then
    source "$file"
  fi
done
