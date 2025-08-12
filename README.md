# homebrew-terminal-jarvis

A Homebrew tap for [Terminal Jarvis](https://github.com/BA-CalderonMorales/terminal-jarvis) - a unified command center for AI coding tools.

## Installation

```bash
# Add the tap
brew tap ba-calderonmorales/terminal-jarvis

# Install Terminal Jarvis
brew install terminal-jarvis
```

## Usage

After installation, you can use Terminal Jarvis directly:

```bash
terminal-jarvis --help
terminal-jarvis --version
```

## For Maintainers

If you're maintaining this Homebrew formula, please see the [Maintainers Guide](docs/MAINTAINERS.md) for detailed instructions on updating the formula when new versions are released.

### Quick Start for Maintainers

1. Open this repository in GitHub Codespace
2. Run the setup script: `./scripts/setup.sh`
3. After each Terminal Jarvis release, run: `./scripts/update-formula.sh`

## Repository Structure

- `Formula/terminal-jarvis.rb` - The Homebrew formula
- `scripts/update-formula.sh` - Automated update script for maintainers
- `docs/MAINTAINERS.md` - Detailed maintainer workflow and troubleshooting

## Support

For issues related to Terminal Jarvis itself, please visit the [main repository](https://github.com/BA-CalderonMorales/terminal-jarvis).

For issues specific to this Homebrew formula, please open an issue in this repository.

## License

This repository is licensed under the same terms as Terminal Jarvis. See [LICENSE](LICENSE) for details.
