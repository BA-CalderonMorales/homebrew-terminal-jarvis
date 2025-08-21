# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Based on Federico Terzi's approach: https://federicoterzi.com/blog/how-to-publish-your-rust-project-on-homebrew/

class TerminalJarvis < Formula
  desc "A unified command center for AI coding tools"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.0.61"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.61/terminal-jarvis-macos-x86_64.tar.gz"
      sha256 ""
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.61/terminal-jarvis-macos-aarch64.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.61/terminal-jarvis-linux-x86_64.tar.gz"
      sha256 ""
    else
      # Fallback for other Linux architectures
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.61/terminal-jarvis-linux.tar.gz"
      sha256 "4c5974621e8b272378751712787f7a35a83d5bd0d0c063ed114147135c42a71d"
    end
  end

  def install
    bin.install "terminal-jarvis"
  end

  test do
    system "#{bin}/terminal-jarvis", "--version"
  end
end
