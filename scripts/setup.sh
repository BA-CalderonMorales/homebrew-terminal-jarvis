#!/bin/bash
set -e

echo "Setting up Terminal Jarvis Homebrew Formula maintenance environment"

# Check if we're in the right directory
if [ ! -f "scripts/update-formula.sh" ]; then
    echo "ERROR: Please run this script from the root of the homebrew-terminal-jarvis repository"
    exit 1
fi

# Check prerequisites
echo "Checking prerequisites..."

MISSING_DEPS=()

if ! command -v jq &> /dev/null; then
    MISSING_DEPS+=("jq")
fi

if ! command -v curl &> /dev/null; then
    MISSING_DEPS+=("curl")
fi

if ! command -v git &> /dev/null; then
    MISSING_DEPS+=("git")
fi

if [ ${#MISSING_DEPS[@]} -ne 0 ]; then
    echo "ERROR: Missing dependencies: ${MISSING_DEPS[*]}"
    echo ""
    echo "To install on Ubuntu/Debian:"
    echo "  sudo apt update && sudo apt install -y ${MISSING_DEPS[*]}"
    echo ""
    echo "To install on macOS:"
    echo "  brew install ${MISSING_DEPS[*]}"
    exit 1
fi

echo "All prerequisites are installed"

# Make scripts executable
echo "Making scripts executable..."
chmod +x scripts/update-formula.sh

# Check git configuration
echo "Checking git configuration..."
if ! git config user.name > /dev/null; then
    echo "WARNING: Git user.name not configured. Please run:"
    echo "  git config --global user.name 'Your Name'"
    exit 1
fi

if ! git config user.email > /dev/null; then
    echo "WARNING: Git user.email not configured. Please run:"
    echo "  git config --global user.email 'your.email@example.com'"
    exit 1
fi

# Check current branch
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "develop" ]; then
    echo "WARNING: Not on develop branch (current: $CURRENT_BRANCH)"
    echo "Switching to develop branch..."
    git checkout develop
fi

echo "Setup complete!"

# Check if we're on the right branch
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "develop" ]; then
    echo "WARNING: Not on develop branch (current: $CURRENT_BRANCH)"
    echo "Switching to develop branch..."
    git checkout develop
fi

echo "Setup complete!"
echo ""
echo "You can now run the formula update script:"
echo "  ./scripts/update-formula.sh"
echo ""
echo "For detailed instructions, see:"
echo "  docs/MAINTAINERS.md"
