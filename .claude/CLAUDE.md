## General
- Never use an em-dash (—) in code comments or documentation; use a regular hyphen (-) instead
- I work in a TUI that does not render markdown hyperlinks. When citing sources or linking to docs/PRs/issues/files, output plain URLs instead of `[label](url)` syntax. The label-only form silently swallows the URL and leaves me unable to navigate.
- When creating or editing markdown files, do not hard-wrap prose. Write each paragraph and each list item as a single line and let the renderer handle wrapping; only break lines for a new paragraph, a new list item, a heading, or table/code structure. Tables and code blocks keep their normal per-line structure. Why: hard-wrapping prose forces a manual re-flow on every edit and makes diffs noisier for no rendering benefit.


## File Creation
- When creating artifact files, save them to `~/claude_artifacts/[repo_name]/[file_name]`
- Use the name of the repo or working directory as `[repo_name]`
- When giving me text to paste somewhere else (PR review comments, PR descriptions, Slack messages), write the raw markdown to `~/claude_artifacts/[repo_name]/[file_name].md` and run `pbcopy < <file>`, then tell me it's on the clipboard and give the path. Why: copying rendered markdown out of the TUI drops backticks and code fences, so the pasted text loses its formatting.


## Tool Selection

- Use `fd` instead of `find` - significantly faster file discovery
- Use `rg` (ripgrep) instead of `grep` - faster text search with better defaults
- Use `bat` instead of `cat` for syntax-highlighted file viewing
- Tell subagents you spawn to use `fd`/`rg` too; they run their own Bash commands


## Searching Claude Code session history

When I ask what we did/said/decided in a past session ("when did you last tell me to...", "have we discussed..."), read `~/.claude/docs/session-history-search.md` first and follow it before answering. Never conclude "never / first time" from a narrow search.


## GitHub & PR Management

- When creating a PR:
  - Always check for and use the project's PR template (usually @.github/PULL_REQUEST_TEMPLATE.md or @.github/pull_request_template.md)
  - Include relevant Jira ticket link(s) in the PR description
    - If you don't have a ticket, ask me for a link to it
  - Always create PRs in draft mode
- In GitHub PR descriptions and comments, every mention of a Jira ticket must be a markdown link to it: write `[XY-123](https://<org>.atlassian.net/browse/XY-123) says ...`, never a bare `XY-123 says ...`. A bare URL on its own line is fine too. (This is separate from the TUI rule above: GitHub renders markdown links, so use them there.)
  - Never @-mention teams or individuals in a PR description (e.g. `@org/team`), even when the repo's PR template says to tag a reviewer. I'll request reviewers myself; the mention just fires notifications I didn't intend.
  - If, after you show me your proposed PR body, I say "edit", do this:
    - Write the PR description you came up with into a file /tmp/pr-description.md (overwrite it if it already exists)
    - I'll edit it in my text editor
    - When I say I'm done, create the PR using the contents of that file as the description


## Technical Reference Notes

Domain-specific mental models, one file each under `~/.claude/docs/`. Read the matching file before working on that topic. Add new entries as new files plus a line here when a hard-won corrected understanding is worth preserving globally.

- OpenTelemetry histograms reaching Datadog as distributions (bucket interpolation, percentile/avg accuracy, threshold-count SLO queries, identical-percentiles gotcha): `~/.claude/docs/otel-histograms-datadog.md`
