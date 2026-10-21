class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.21/terminal-jarvis-0.1.21-macos-x64.tar.gz"
      sha256 "0f413aa1e921d248d7b7d430f4e70e2563cc9e51c6ca1fe7c35e4d19abaeabe6"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.21/terminal-jarvis-0.1.21-macos-arm64.tar.gz"
      sha256 "928c03f205db74039936b4831c3a5c1929cd79222485ec610cffaeba8d182700"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.21/terminal-jarvis-0.1.21-linux-x64-gnu.tar.gz"
      sha256 "7ad9d76651ecdffe0818ed7e09ae536f3d5403f1c52f2f001603e7aaa30b1b37"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.21/terminal-jarvis-0.1.21-linux-arm64-gnu.tar.gz"
      sha256 "88dabbdddb2de4d9e471d1cd22b5029645522272cdac4b87807df1163cff11f0"
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
