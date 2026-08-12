class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.14/terminal-jarvis-0.1.14-macos-x64.tar.gz"
      sha256 "487ba3821b860309a3b9a4e146c1c7d5159bd5bbb485c2ad41f3a36d23847ba8"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.14/terminal-jarvis-0.1.14-macos-arm64.tar.gz"
      sha256 "05c7bc41c64dbe9ad47a0761b6239ed72089d8545a9aa643990672b5fde1ffae"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.14/terminal-jarvis-0.1.14-linux-x64-gnu.tar.gz"
      sha256 "f95475b41bdeec01a066f0d602f698ce68bfe039debd8d1ec7a31510a5311e49"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.14/terminal-jarvis-0.1.14-linux-arm64-gnu.tar.gz"
      sha256 "f0b3b4d9e7eeae96955677391dcf85b81c6a09d6bd277d726c673517c5c028aa"
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
