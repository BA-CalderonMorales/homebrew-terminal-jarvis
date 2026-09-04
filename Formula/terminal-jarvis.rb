class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.16/terminal-jarvis-0.1.16-macos-x64.tar.gz"
      sha256 "7aa6d1dba95550bbc57a3700897e111be0a1c49e00c1bd443a1d817ae621e7d9"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.16/terminal-jarvis-0.1.16-macos-arm64.tar.gz"
      sha256 "66bda4247fb81d0e0a615cfe15af4ab6e0ef37689bf2f549aaa8f4ca9b04a7ab"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.16/terminal-jarvis-0.1.16-linux-x64-gnu.tar.gz"
      sha256 "f190fa81d91e913cdef426563efd130a857ffc7f8a857795e2adf055f806fc57"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.16/terminal-jarvis-0.1.16-linux-arm64-gnu.tar.gz"
      sha256 "fc9f75954bdfc6ef110f8ca96653899c87fddd2bd73317bb5c31cd8c89ac0cda"
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
