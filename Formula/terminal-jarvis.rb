class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.22/terminal-jarvis-0.1.22-macos-x64.tar.gz"
      sha256 "636e5b9e97236ed0b308bdf2e9a14523d8332050247dec1b3de938d7414a52b3"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.22/terminal-jarvis-0.1.22-macos-arm64.tar.gz"
      sha256 "f7351f5e30acbf1a95faf753bede6a3d2cd19112c50ba7db79c6c6c02be8cac0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.22/terminal-jarvis-0.1.22-linux-x64-gnu.tar.gz"
      sha256 "804e1006592dc8f27292e70e50d59505abcd2f2827ca8f22d374e1d2334e6af3"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.22/terminal-jarvis-0.1.22-linux-arm64-gnu.tar.gz"
      sha256 "7c954b3119aa4ed1801059070ae7f0e2da76d3e9434a7d2bc4a069ad1ab64f25"
    end
  end

  def install
    bin.install "bin/terminal-jarvis"
    pkgshare.install "harnesses", "gates"
  end

  test do
    assert_match "terminal-jarvis", shell_output("#{bin}/terminal-jarvis --help")
  end
end
