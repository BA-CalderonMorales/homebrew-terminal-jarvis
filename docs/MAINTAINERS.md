# Maintainers Guide

## Overview

This repository maintains the Homebrew formula for Terminal Jarvis, providing a clean separation of concerns between the main project and package distribution.

## Workflow

The workflow is now:

1. **Main repo**: Run `local-cd.sh` → publishes to NPM/Crates.io/GitHub
2. **Homebrew repo (maintainer action)**: Run the setup snippet below, then use `./scripts/update-formula.sh` after each release
3. **Users**: Can install via `brew tap ba-calderonmorales/terminal-jarvis && brew install terminal-jarvis`

This gives you a clean separation of concerns while making the Homebrew Formula updates straightforward for maintainers.

## Maintainer Setup

When a new version is released in the main repository, follow these steps:

### Prerequisites

1. **GitHub CLI**: Ensure `gh` is installed and authenticated (optional)
2. **jq**: JSON processor for parsing API responses
3. **curl**: For downloading archives and API calls
4. **Git**: Configured with your GitHub credentials
5. **Codespace Access**: Open this repository in GitHub Codespace

### Quick Setup

For first-time setup, run the setup script:

```bash
./scripts/setup.sh
```

This will check all prerequisites and configure your environment.

### Update Process

After the main repository publishes a new version:

1. **Open this repository in Codespace**
2. **Run the update script**:
   ```bash
   ./scripts/update-formula.sh
   ```
3. **Verify the Formula was updated correctly**:
   - Check that `Formula/terminal-jarvis.rb` has the correct version
   - Verify SHA256 checksums are updated
   - Ensure both Mac and Linux URLs are correct

### What the Script Does

The `update-formula.sh` script will:

- Fetch the latest release from GitHub API
- Download and calculate SHA256 checksums for Mac and Linux archives
- Update the Formula with correct version and checksums
- Commit and push changes automatically

### Manual Verification

After running the script, you can manually verify:

```bash
# Check the formula content
cat Formula/terminal-jarvis.rb

# Verify git changes
git log --oneline -n 5

# Test locally (if possible)
brew install --build-from-source ./Formula/terminal-jarvis.rb
terminal-jarvis --version
```

### Troubleshooting

**Common Issues:**

1. **API Rate Limits**: If GitHub API calls fail, wait a few minutes or use authentication
2. **Archive Not Found**: Ensure the main repo has published the release with the expected archive names
3. **Checksum Mismatch**: Re-run the script as checksums are calculated fresh each time
4. **Git Push Fails**: Ensure you have write access to this repository

**Expected Archive Names:**
- Mac: `terminal-jarvis-mac.tar.gz`
- Linux: `terminal-jarvis-linux.tar.gz`

### Release Cadence

Update the Homebrew formula within 24-48 hours of each Terminal Jarvis release to ensure users have access to the latest features and fixes.

## Repository Structure

```
homebrew-terminal-jarvis/
├── Formula/
│   └── terminal-jarvis.rb          # The actual Homebrew formula
├── scripts/
│   └── update-formula.sh           # Automated update script
├── docs/
│   └── MAINTAINERS.md             # This file
├── README.md                       # User-facing documentation
└── LICENSE                         # Repository license
```

## Contact

For questions about maintaining this formula, please reach out to the Terminal Jarvis maintainers or open an issue in this repository.
