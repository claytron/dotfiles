Be terse unless I ask for more verbosity.

# Coding Style

- Don't leave extraneous trailing whitespace unless it is explicitly needed.
- Always add newlines to the end of new files

# Documentation in Markdown

- When writing paragraphs, put each sentence on a line of its own, no wrapping.
  This makes diffs more legible.
- Use `rumdl` to fix formatting issues when writing new documents.
  Don't reformat existing docs.

# Tools

- Prefer `rg` (ripgrep) over `grep -r` / `grep -l` for filesystem searches — faster and respects .gitignore.
  Reserve plain `grep` for single-file matches or piping.
- When creating worktrees, use the worktrunk command (`wt`) and follow its config (either global or in the current project)
