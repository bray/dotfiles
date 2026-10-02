## General
- Never use an em-dash (—) in code comments or documentation; use a regular hyphen (-) instead
- I work in a TUI that does not render markdown hyperlinks. When citing sources or linking to docs/PRs/issues/files, output plain URLs instead of `[label](url)` syntax. The label-only form silently swallows the URL and leaves me unable to navigate.
- When creating or editing markdown files, do not hard-wrap prose. Write each paragraph and each list item as a single line and let the renderer handle wrapping; only break lines for a new paragraph, a new list item, a heading, or table/code structure. Tables and code blocks keep their normal per-line structure. Why: hard-wrapping prose forces a manual re-flow on every edit and makes diffs noisier for no rendering benefit.


## File Creation
- When creating artifact files, save them to `~/claude_artifacts/[repo_name]/[file_name]`
- Use the name of the repo or working directory as `[repo_name]`


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


## Technical Reference Notes

Domain-specific mental models I should remember across all projects. Add new entries here when a hard-won corrected understanding is worth preserving globally.

### OpenTelemetry histograms -> Datadog distributions

When OTel histograms reach Datadog via the agent's `histograms.mode = distributions` (the recommended/default mode), the data flow is:

1. **Wire format:** the SDK exports one OTLP histogram payload per export window, containing `sum`, `count`, bucket counts, and optionally exact `min`/`max`.
2. **Agent translation:** the DD agent walks the bucket counts and synthesizes N samples (where N = total count in the histogram) at bucket boundaries. These synthetic samples flow into a Datadog distribution metric.
3. **DD storage:** DDSketch over the synthesized samples - per-sample fidelity preserved at bucket-boundary resolution.
4. **DD UI:** "points" count = synthetic sample count = original `record()` emission count. Percentile values are snapped to bucket boundaries, except `min`/`max` which retain exact values when the SDK populated the OTLP optional fields.

Practical consequences:
- 10 `record()` calls produce 10 visible points in DD's UI even though the wire payload was 1 aggregated histogram
- Wire-level aggregation saves bandwidth but is invisible to DD's point count
- p50/p99 will land on histogram bucket boundaries, not exact original sample values
- `min`/`max` can be exact when SDK exports the OTLP optional fields

Compared to statsd-emitted DD distributions: nearly equivalent in the DD UI. The only fidelity difference is within-bucket value precision - statsd preserves exact sample values; OTLP histograms quantize values to bucket boundaries during the agent's reconstruction.

Common diagnostic gotcha: a metric whose values appear identical across all percentiles in DD usually means all samples landed in a single bucket (often `[max_boundary, +Inf)`). Fix is either varying the input data (if probe-stage) or setting `histogram_bucket_overrides` in the runtime config to bracket the actual value range.
