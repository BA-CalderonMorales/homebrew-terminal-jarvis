class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.6/terminal-jarvis-0.1.6-macos-x64.tar.gz"
      sha256 "e3ebfd08047c52114d2ad2a4c094de2b9ac1e0a6ec97a7cf0d02c005d595aee0"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.6/terminal-jarvis-0.1.6-macos-arm64.tar.gz"
      sha256 "55756fd05da0e8e793d1c1333ffb9f56c27186b9d86e9b40e79bd654d4741ff5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.6/terminal-jarvis-0.1.6-linux-x64-gnu.tar.gz"
      sha256 "05c724d95bfb4476d6d94faeb2e52a603c0c6f18b0f94303657d53b7fa51737c"
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
