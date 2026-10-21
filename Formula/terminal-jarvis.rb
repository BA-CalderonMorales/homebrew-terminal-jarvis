class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.21/terminal-jarvis-0.1.21-macos-x64.tar.gz"
      sha256 "1f3c0bdb9d7fffdbed951864704e38cdef791e9a3ee94e6ee9e70fa0c3c05b83"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.21/terminal-jarvis-0.1.21-macos-arm64.tar.gz"
      sha256 "f0284e35b268c53b0394b5dfabd1b586a8e7fa2c991d8e032063341666996a7a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.21/terminal-jarvis-0.1.21-linux-x64-gnu.tar.gz"
      sha256 "73f52df61f5c86f2b013a7517150bb1f50e82d01f29dce1c730330ae20d03cc1"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.21/terminal-jarvis-0.1.21-linux-arm64-gnu.tar.gz"
      sha256 "3a763e99d4e39a1b53b2b567dbaf930443dd7c8b4a60213cbdf0e6ec80b2438d"
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
