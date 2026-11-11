# Searching Claude Code session history

When I ask what we did/said/decided in a past session ("when did you last tell me to...", "have we discussed...", "in a previous conversation/directory"), search the FULL local history before answering. Do not conclude "never / first time" from a narrow search.

- Two stores with different shapes and lifetimes:
    - `~/.claude/projects/<encoded-cwd>/<session-uuid>.jsonl` - full transcripts (both my prompts AND your assistant turns), but these are pruned after `cleanupPeriodDays` (default 30). Older sessions' assistant turns are simply gone from disk.
    - `~/.claude/history.jsonl` - durable log of MY typed prompts only. Fields: `display` (the prompt text), `pastedContents`, `timestamp` (ms epoch), `project`, `sessionId`. It is kept long after transcripts are pruned, so it is often the only surviving evidence of an old session. Because it stores only my prompts, a command YOU suggested appears here only if I later quoted/typed it - your suggestions live exclusively in the (prunable) transcript.
- Always search with `rg -uuu` (unrestricted). Plain `rg` skips hidden files and anything matched by .gitignore/.ignore and can silently miss matches. Search the whole `~/.claude` tree, not just `projects/`. Also check `~/.zsh_history` for commands I actually ran.
- If the transcript that would contain the answer has been pruned, say the record is gone (and cite what history.jsonl still shows) rather than asserting the event did not happen.
