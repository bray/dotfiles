#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract values using jq
get_model_display() { echo "$input" | jq -r '.model.display_name'; }
get_current_dir() { echo "$input" | jq -r '.workspace.current_dir'; }

# Show git branch if in a git repo
get_git_branch() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    local branch
    branch=$(git branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
      echo "🌿 $branch"
    fi
  fi
}

get_total_cost() { echo "$input" | jq -r '.cost.total_cost_usd' | xargs printf "%.2f"; }

get_context_usage() {
  local percent_used
  local usage=$(echo "$input" | jq '.context_window.current_usage')

  if [ "$usage" != "null" ]; then
    # Calculate current context from current_usage fields
    local current_tokens=$(echo "$usage" | jq '.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens')
    local context_size=$(echo "$input" | jq -r '.context_window.context_window_size')
    percent_used=$((current_tokens * 100 / context_size))
  else
    percent_used=0
  fi

  echo "Context used: ${percent_used}%"
}


model_display=$(get_model_display)
current_dir=$(get_current_dir)
git_branch=$(get_git_branch)
total_cost=$(get_total_cost)
context_usage=$(get_context_usage)

# Append a session cost record to the JSONL log on every statusline refresh.
# Errors are swallowed so logging issues never break the statusline render.
{
  echo "$input" | jq -c \
    --arg branch "$(git branch --show-current 2>/dev/null)" \
    '{
      timestamp: (now | todate),
      session_id: .session_id,
      cost_usd: .cost.total_cost_usd,
      duration_ms: .cost.total_duration_ms,
      api_duration_ms: .cost.total_api_duration_ms,
      model: .model.id,
      model_display: .model.display_name,
      cwd: .workspace.current_dir,
      branch: $branch
    }' >> ~/.claude/session-costs.jsonl
} 2>/dev/null || true

echo "[$model_display] 📁 ${current_dir##*/} | $git_branch | $context_usage | 💰 \$$total_cost"
