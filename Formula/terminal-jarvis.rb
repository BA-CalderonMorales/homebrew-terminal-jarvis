class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.1/terminal-jarvis-0.1.1-macos-x64.tar.gz"
      sha256 "091d028a85d2f0ad741689f7d190a0ad433ac6274d899b8df7ca1ae3cc5dc3ca"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.1/terminal-jarvis-0.1.1-macos-arm64.tar.gz"
      sha256 "90dcf6863af6ae103cf13918fbe5669e59cf7d8401944aee084498902d27ff06"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.1/terminal-jarvis-0.1.1-linux-x64-gnu.tar.gz"
      sha256 "ca37eeacca790bc70972720cb21dc08409969b1a524c5c4a887dd47860afa747"
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
