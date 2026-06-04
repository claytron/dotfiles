# Coding Style

- Don't leave extraneous trailing whitespace unless it is explicitly needed.
- Always add newlines to the end of new files

# Documentation in Markdown

- When writing paragraphs, put each sentence on a line of its own, no wrapping. This makes diffs more legible.

# Tools

- Prefer `rg` (ripgrep) over `grep -r` / `grep -l` for filesystem searches — faster and respects .gitignore. Reserve plain `grep` for single-file matches or piping.
