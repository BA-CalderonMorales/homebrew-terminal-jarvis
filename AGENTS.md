# AGENTS.md - Homebrew Terminal Jarvis

## Quick Reference

- **Purpose**: Homebrew formula for Terminal Jarvis
- **Formula**: `Formula/terminal-jarvis.rb`

## Repository Structure

```
Formula/           # Homebrew formulas
docs/              # Permanent documentation
tmp/               # Temporary files (never committed)
```

## Documentation Rules

1. **Root .md files**: Only README.md, CONTRIBUTING.md, LICENSE.md, CHANGELOG.md, AGENTS.md
2. **tmp/ folder**: One-off .md files, never commit to git
3. **docs/ folder**: Permanent documentation, lowercase naming

## Formula Updates

Formula is auto-updated via CI/CD from terminal-jarvis releases.

## Working Rules

- Stop and explain before major architectural changes
- One change per commit, commit before starting next
- Do not bundle unrelated work into the same commit
