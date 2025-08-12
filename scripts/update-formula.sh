#!/bin/bash
set -e

echo "🍺 Updating Terminal Jarvis Homebrew Formula"

# Configuration
REPO_OWNER="BA-CalderonMorales"
REPO_NAME="terminal-jarvis"
FORMULA_FILE="Formula/terminal-jarvis.rb"

# Prerequisites check
echo "🔍 Checking prerequisites..."
if ! command -v jq &> /dev/null; then
    echo "❌ jq is required but not installed. Please install it first."
    exit 1
fi

if ! command -v curl &> /dev/null; then
    echo "❌ curl is required but not installed. Please install it first."
    exit 1
fi

if ! command -v git &> /dev/null; then
    echo "❌ git is required but not installed. Please install it first."
    exit 1
fi

# Get current version from formula if it exists
CURRENT_VERSION=""
if [ -f "$FORMULA_FILE" ]; then
    CURRENT_VERSION=$(grep -E "^\s*version\s+" "$FORMULA_FILE" | sed 's/.*"\([^"]*\)".*/\1/' | head -n1)
    echo "📋 Current formula version: $CURRENT_VERSION"
fi

# Get latest version from GitHub API
echo "📡 Fetching latest version..."
LATEST_RELEASE=$(curl -s "https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/releases/latest")

if [ $? -ne 0 ]; then
    echo "❌ Failed to fetch release information from GitHub API"
    exit 1
fi

LATEST_VERSION=$(echo "$LATEST_RELEASE" | jq -r '.tag_name' | sed 's/v//')

if [ "$LATEST_VERSION" = "null" ] || [ -z "$LATEST_VERSION" ]; then
    echo "❌ Could not fetch latest version from GitHub API"
    echo "API Response: $LATEST_RELEASE"
    exit 1
fi

echo "🎯 Latest version: $LATEST_VERSION"

# Check if update is needed
if [ "$CURRENT_VERSION" = "$LATEST_VERSION" ]; then
    echo "✨ Formula is already up to date (v$LATEST_VERSION)"
    exit 0
fi

# Download archives to calculate checksums
echo "🔍 Calculating checksums..."
MAC_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}/releases/download/v${LATEST_VERSION}/terminal-jarvis-mac.tar.gz"
LINUX_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}/releases/download/v${LATEST_VERSION}/terminal-jarvis-linux.tar.gz"

# Verify archives exist before downloading
echo "🔗 Verifying Mac archive exists..."
if ! curl -sf "$MAC_URL" > /dev/null; then
    echo "❌ Mac archive not found at: $MAC_URL"
    echo "Please ensure the release includes the expected archive name: terminal-jarvis-mac.tar.gz"
    exit 1
fi

echo "🔗 Verifying Linux archive exists..."
if ! curl -sf "$LINUX_URL" > /dev/null; then
    echo "❌ Linux archive not found at: $LINUX_URL"
    echo "Please ensure the release includes the expected archive name: terminal-jarvis-linux.tar.gz"
    exit 1
fi

# Calculate checksums
echo "🍎 Calculating Mac SHA256..."
MAC_SHA256=$(curl -sL "$MAC_URL" | sha256sum | cut -d' ' -f1)
if [ ${#MAC_SHA256} -ne 64 ]; then
    echo "❌ Invalid Mac SHA256 checksum: $MAC_SHA256"
    exit 1
fi

echo "🐧 Calculating Linux SHA256..."
LINUX_SHA256=$(curl -sL "$LINUX_URL" | sha256sum | cut -d' ' -f1)
if [ ${#LINUX_SHA256} -ne 64 ]; then
    echo "❌ Invalid Linux SHA256 checksum: $LINUX_SHA256"
    exit 1
fi

echo "🍎 Mac SHA256: $MAC_SHA256"
echo "🐧 Linux SHA256: $LINUX_SHA256"

# Generate Formula content
echo "📝 Updating formula content..."
cat > "$FORMULA_FILE" << EOF
# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Based on Federico Terzi's approach: https://federicoterzi.com/blog/how-to-publish-your-rust-project-on-homebrew/

class TerminalJarvis < Formula
  desc "A unified command center for AI coding tools"
  homepage "https://github.com/${REPO_OWNER}/${REPO_NAME}"
  
  if OS.mac?
    url "${MAC_URL}"
    sha256 "${MAC_SHA256}"
  elsif OS.linux?
    url "${LINUX_URL}" 
    sha256 "${LINUX_SHA256}"
  end
  
  version "${LATEST_VERSION}"

  def install
    bin.install "terminal-jarvis"
  end

  test do
    system "#{bin}/terminal-jarvis", "--version"
  end
end
EOF

echo "✅ Formula updated to version $LATEST_VERSION"

# Verify the formula was written correctly
if ! grep -q "version \"$LATEST_VERSION\"" "$FORMULA_FILE"; then
    echo "❌ Formula verification failed - version not found in generated file"
    exit 1
fi

if ! grep -q "$MAC_SHA256" "$FORMULA_FILE"; then
    echo "❌ Formula verification failed - Mac checksum not found in generated file"
    exit 1
fi

if ! grep -q "$LINUX_SHA256" "$FORMULA_FILE"; then
    echo "❌ Formula verification failed - Linux checksum not found in generated file"
    exit 1
fi

echo "✅ Formula verification passed"

# Commit and push changes
if [ -n "$(git status --porcelain)" ]; then
    echo "📝 Committing changes..."
    git add "$FORMULA_FILE"
    
    # Ensure we're on the develop branch
    CURRENT_BRANCH=$(git branch --show-current)
    if [ "$CURRENT_BRANCH" != "develop" ]; then
        echo "⚠️  Warning: Not on develop branch (current: $CURRENT_BRANCH)"
        echo "Switching to develop branch..."
        git checkout develop
    fi
    
    git commit -m "feat: update Terminal Jarvis to v${LATEST_VERSION}

- Updated version from v${CURRENT_VERSION} to v${LATEST_VERSION}
- Updated Mac archive SHA256: ${MAC_SHA256}
- Updated Linux archive SHA256: ${LINUX_SHA256}"
    
    echo "🚀 Pushing changes to repository..."
    if git push origin develop; then
        echo "🚀 Changes pushed successfully"
    else
        echo "❌ Failed to push changes. Please check your git credentials and permissions."
        exit 1
    fi
else
    echo "✨ No changes needed - Formula already up to date"
fi

echo "🎉 Formula update complete!"
echo ""
echo "Summary:"
echo "  Previous version: ${CURRENT_VERSION:-"none"}"
echo "  Updated version:  $LATEST_VERSION"
echo "  Mac SHA256:       $MAC_SHA256"
echo "  Linux SHA256:     $LINUX_SHA256"
echo ""
echo "Users can now install the latest version with:"
echo "  brew tap ba-calderonmorales/terminal-jarvis"
echo "  brew install terminal-jarvis"
