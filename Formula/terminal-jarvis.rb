class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.11/terminal-jarvis-0.1.11-macos-x64.tar.gz"
      sha256 "1195b48d74fd41b6a60e51e5f57272669be9faf1d745971cc96ec52287d6ae71"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.11/terminal-jarvis-0.1.11-macos-arm64.tar.gz"
      sha256 "8553172f090ee6002d025eca6876ce5dc77b32e9a1d0dfbcfeef721e6b14dd90"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.11/terminal-jarvis-0.1.11-linux-x64-gnu.tar.gz"
      sha256 "5f688849293e7a91e2cf6762e2641c826da36a530faba17bd3d52ef143159485"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.11/terminal-jarvis-0.1.11-linux-arm64-gnu.tar.gz"
      sha256 "7703d12a035c02ab310ba485af2b1ab06aa876b5b7d5ca49325f5bf59bfc0c5a"
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
