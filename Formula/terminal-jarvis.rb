class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.0/terminal-jarvis-0.1.0-macos-x64.tar.gz"
      sha256 "0a2e46ea4c9a342a1d3ee496b11729c4f9bfbb21a114ef4760056be35958ceb1"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.0/terminal-jarvis-0.1.0-macos-arm64.tar.gz"
      sha256 "29bc465d28b9292f463849a411c99c812fa3f001d3e9c9534b123790b543603d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.0/terminal-jarvis-0.1.0-linux-x64-gnu.tar.gz"
      sha256 "4e1a80552a90815e557a77a7cb5360e2a8e61450f4dad11007be088fe64389fa"
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
