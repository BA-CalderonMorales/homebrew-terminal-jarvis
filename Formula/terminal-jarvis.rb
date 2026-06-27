class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.4/terminal-jarvis-0.1.4-macos-x64.tar.gz"
      sha256 "8c15d2d47fe111270b141a3da2e0d2e95a6cae8fb4ebf923d55e4cc99f30d861"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.4/terminal-jarvis-0.1.4-macos-arm64.tar.gz"
      sha256 "bff0945b2658e7fdd9e6ef89f514e32cd5f331d8c2e1f0af581f12030f5ba3c6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.4/terminal-jarvis-0.1.4-linux-x64-gnu.tar.gz"
      sha256 "23f6c7aae094e78c1d9f48201a6338135341773ee0bd671e4eab917e45ba24cc"
    end
  end

  def install
    bin.install "bin/terminal-jarvis"
    pkgshare.install "harnesses"
  end

  test do
    assert_match "terminal-jarvis", shell_output("#{bin}/terminal-jarvis --help")
  end
end
