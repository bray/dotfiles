## Tool Selection

- Use `fd` instead of `find` - significantly faster file discovery
- Use `rg` (ripgrep) instead of `grep` - faster text search with better defaults
- Use `bat` instead of `cat` for syntax-highlighted file viewing


## GitHub & PR Management

- When creating a PR:
  - Always check for and use the project's PR template (usually @.github/PULL_REQUEST_TEMPLATE.md or @.github/pull_request_template.md)
  - Include relevant Jira ticket link(s) in the PR description
    - If you don't have a ticket, ask me for a link to it
  - Always create PRs in draft mode
  - If, after you show me your proposed PR body, I say "edit", do this:
    - Write the PR description you came up with into a file /tmp/pr-description.md (overwrite it if it already exists)
    - I'll edit it in my text editor
    - When I say I'm done, create the PR using the contents of that file as the description
