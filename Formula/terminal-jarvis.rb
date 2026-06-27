class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.3/terminal-jarvis-0.1.3-macos-x64.tar.gz"
      sha256 "8464ae4b585823e7e86f78e831c2a470e475db18a49053a8048559d6848e11f7"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.3/terminal-jarvis-0.1.3-macos-arm64.tar.gz"
      sha256 "d1c27239c450aa85be8f139e1101d629380b6ec156f44e16fdd09c83d234ce6c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.3/terminal-jarvis-0.1.3-linux-x64-gnu.tar.gz"
      sha256 "a5fae18f411bd514c0f2b48511ab7199263b7bf176ab60ca4d40cf68ff3ea6ec"
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
