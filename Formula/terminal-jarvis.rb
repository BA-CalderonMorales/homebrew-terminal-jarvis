class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.0/terminal-jarvis-0.1.0-macos-x64.tar.gz"
      sha256 "4640bce80f3e526e44e2e1d06f00829ee336eb5484ed0b737280a19cdeff1197"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.0/terminal-jarvis-0.1.0-macos-arm64.tar.gz"
      sha256 "bfb23efdd306793b68b620792064e5c23660a2ac6dac11e657e7b72ab3c9e870"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.0/terminal-jarvis-0.1.0-linux-x64-gnu.tar.gz"
      sha256 "3d18df85e5d4fced954874fbcb16bf4e9c1535315cc8374899b619dace91d14e"
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
