#!/bin/bash
set -e

echo "Updating Terminal Jarvis Homebrew Formula from main repository"

# Configuration
REPO_OWNER="BA-CalderonMorales"
REPO_NAME="terminal-jarvis"
HOMEBREW_TAP_REPO="homebrew-terminal-jarvis"
FORMULA_FILE="Formula/terminal-jarvis.rb"
MAIN_REPO_FORMULA_URL="https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/main/homebrew/Formula/terminal-jarvis.rb"

# Prerequisites check
echo "Checking prerequisites..."
if ! command -v curl &> /dev/null; then
    echo "ERROR: curl is required but not installed. Please install it first."
    exit 1
fi

if ! command -v git &> /dev/null; then
    echo "ERROR: git is required but not installed. Please install it first."
    exit 1
fi

# Get current version from formula if it exists
CURRENT_VERSION=""
if [ -f "$FORMULA_FILE" ]; then
    CURRENT_VERSION=$(grep -E "^\s*version\s+" "$FORMULA_FILE" | sed 's/.*"\([^"]*\)".*/\1/' | head -n1)
    echo "Current formula version: $CURRENT_VERSION"
fi

# Download the latest formula from main repo
echo "Fetching latest formula from main repository..."
TEMP_FORMULA=$(mktemp)

if ! curl -sf "$MAIN_REPO_FORMULA_URL" -o "$TEMP_FORMULA"; then
    echo "ERROR: Failed to download formula from main repository"
    echo "URL: $MAIN_REPO_FORMULA_URL"
    exit 1
fi

# Extract version from the downloaded formula
NEW_VERSION=$(grep -E "^\s*version\s+" "$TEMP_FORMULA" | sed 's/.*"\([^"]*\)".*/\1/' | head -n1)

if [ -z "$NEW_VERSION" ]; then
    echo "ERROR: Could not extract version from main repository formula"
    rm "$TEMP_FORMULA"
    exit 1
fi

echo "Main repository formula version: $NEW_VERSION"

# Check if update is needed
if [ "$CURRENT_VERSION" = "$NEW_VERSION" ]; then
    echo "Formula is already up to date (v$NEW_VERSION)"
    
    # Still verify the content matches exactly
    if diff -q "$FORMULA_FILE" "$TEMP_FORMULA" > /dev/null 2>&1; then
        echo "Formula content is identical"
        rm "$TEMP_FORMULA"
        exit 0
    else
        echo "Formula versions match but content differs, updating..."
    fi
fi

# Verify the archives exist in the release
echo "Verifying release assets exist..."
MAC_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}/releases/download/v${NEW_VERSION}/terminal-jarvis-mac.tar.gz"
LINUX_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}/releases/download/v${NEW_VERSION}/terminal-jarvis-linux.tar.gz"

echo "Verifying Mac archive exists..."
if ! curl -sf "$MAC_URL" > /dev/null; then
    echo "ERROR: Mac archive not found at: $MAC_URL"
    echo "The main repository formula expects this file but it doesn't exist in the release"
    rm "$TEMP_FORMULA"
    exit 1
fi

echo "Verifying Linux archive exists..."
if ! curl -sf "$LINUX_URL" > /dev/null; then
    echo "ERROR: Linux archive not found at: $LINUX_URL"
    echo "The main repository formula expects this file but it doesn't exist in the release"
    rm "$TEMP_FORMULA"
    exit 1
fi

echo "All required archives verified"

# Create Formula directory if it doesn't exist
mkdir -p "$(dirname "$FORMULA_FILE")"

# Copy the formula from main repo
cp "$TEMP_FORMULA" "$FORMULA_FILE"
rm "$TEMP_FORMULA"

echo "Formula synchronized with main repository (v$NEW_VERSION)"

# Verify the formula was copied correctly
if ! grep -q "version \"$NEW_VERSION\"" "$FORMULA_FILE"; then
    echo "ERROR: Formula verification failed - version not found in copied file"
    exit 1
fi

echo "Formula verification passed"

# Commit and push changes
if [ -n "$(git status --porcelain)" ]; then
    echo "Committing changes..."
    git add "$FORMULA_FILE"
    
    # Ensure we're on the develop branch
    CURRENT_BRANCH=$(git branch --show-current)
    if [ "$CURRENT_BRANCH" != "develop" ]; then
        echo "WARNING: Not on develop branch (current: $CURRENT_BRANCH)"
        echo "Switching to develop branch..."
        git checkout develop
    fi
    
    git commit -m "feat: sync Terminal Jarvis formula with main repository v${NEW_VERSION}

- Synchronized with main repository homebrew/Formula/terminal-jarvis.rb
- Updated from v${CURRENT_VERSION:-"unknown"} to v${NEW_VERSION}
- Ensures consistency between main repo and tap formula"
    
    echo "Pushing changes to repository..."
    if git push origin develop; then
        echo "Changes pushed successfully"
    else
        echo "ERROR: Failed to push changes. Please check your git credentials and permissions."
        exit 1
    fi
else
    echo "No changes needed - Formula already synchronized"
fi

echo "Formula synchronization complete!"
echo ""
echo "Summary:"
echo "  Previous version: ${CURRENT_VERSION:-"none"}"
echo "  Synchronized version: $NEW_VERSION"
echo "  Source: ${MAIN_REPO_FORMULA_URL}"
echo ""
echo "Users can now install with:"
echo "  brew tap ba-calderonmorales/terminal-jarvis"
echo "  brew install terminal-jarvis"
echo ""
echo "To force refresh the tap cache:"
echo "  brew untap ba-calderonmorales/terminal-jarvis"
echo "  brew tap ba-calderonmorales/terminal-jarvis"
